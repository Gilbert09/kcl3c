class ApiController < ApplicationController

=begin
this class is a controller for the Rightmove and Zoopla APIs, it takes data from the wizard part of the website as a
user fills in each section of the wizard with their property details, at current the methods to send data to the websites
simply returns true as we have no access to the APIs, it inherits all the methods of the ApplicationController class.
=end

  # this method takes the data in a json format ready to send a property to Rightmove and Zoopla.
  def sendProperty(jsonData)
    return true
  end

  # this method takes a property id in order to be able to then remove it from Zoopla and Rightmove.
  def removeProperty(propertyId)
    return true
  end

  # this method returns a list of all the properties on Rightmove and Zoopla currently listed on their website under this website.
  def getBranchPropertyList(branchId)
    return true
  end

  # this method takes the data in a json format ready to send a property to Rightmove and Zoopla, it is a premium listing.
  def addPremiumListing(jsonData)
    return true
  end

  # this method takes the data in a json format ready to send a property to Rightmove and Zoopla, it is a featured listing.
  def addFeaturedProperty(jsonData)
    return true
  end

  # this method takes a property id in order to be able to then remove it from Zoopla and Rightmove, it is however a featured property.
  def removeFeaturedProperty(propertyId)
    return true
  end

  # this method saves an incomplete listing and is called if a user does not finish a listing.
  def saveDraft(jsonData, stage, current_user, property)
    case stage
      when "1"
        stage1(jsonData, stage, current_user, property)
      when "2"
        stage2(jsonData, stage, current_user, property)
      when "3"
        stage3(jsonData, stage, current_user, property)
      when "4"
        stage4(jsonData, stage, current_user, property)
      when "5"
        stage5(jsonData, stage, current_user, property)
      when "6"
        stage6(jsonData, stage, current_user, property)
      when "7"
        stage7(jsonData, stage, current_user, property)
      when "8"
        stage8(jsonData, stage, current_user, property)
      when "9"
        stage9(jsonData, stage, current_user, property)
      when "10"
        stage10(jsonData, stage, current_user, property)
      else 
        return JSON.parse('{ "result": "Error", "message": "Invalid stage" }')
    end
  end

  # the methods below this line are all private.
  private

  # this method takes all the data from the first stage of listing of a property on the wizard, it takes parameters to help identify the user working.
    def stage1(jsonData, stage, current_user, propertyID)
      current_user.first_name = jsonData["first_name"]
      current_user.last_name = jsonData["last_name"]
      current_user.email = jsonData["email"]
      current_user.phone_number = jsonData["phone_number"]
      current_user.save
      return JSON.parse('{ "result": "Success", "message": "Data saved" }')
    end

  # this method takes all the data from the second stage of listing of a property on the wizard.
    def stage2(jsonData, stage, current_user, propertyID)
      newAddress = true
      if jsonData["address_id"] != nil
        current_user.properties.each do |p|
          if p.address.id == jsonData["address_id"] then newAddress = false end
        end
      end

      if newAddress == true and jsonData["address_id"] != nil then
        return JSON.parse('{ "result": "Error", "message": "Invalid address ID" }')
      end

      if newAddress then
        address = Address.new
        property = Property.find(propertyID)
        address.save

        address.property_id = property.id
        property.address_id = address.id
        property.save

        address.house_name_number = jsonData["house_name_number"]
        address.address_line_1 = jsonData["address_line_1"]
        address.address_line_2 = jsonData["address_line_2"]
        address.town_city = jsonData["city"]
        address.county = jsonData["county"]
        address.post_code = jsonData["postcode"]
        address.save
        return JSON.parse("{ \"result\": \"Success\", \"message\": \"Data saved\", \"data\": { \"address_id\": #{address.id.to_s}, \"property_id\": #{property.id.to_s} } }")
      else
        address = Address.find(jsonData["address_id"] )
        address.house_name_number = jsonData["house_name_number"]
        address.address_line_1 = jsonData["address_line_1"]
        address.address_line_2 = jsonData["address_line_2"]
        address.town_city = jsonData["city"]
        address.county = jsonData["county"]
        address.post_code = jsonData["postcode"]
        address.save
        return JSON.parse("{ \"result\": \"Success\", \"message\": \"Data saved\", \"data\": { \"address_id\": #{address.id.to_s}, \"property_id\": #{address.property_id.to_s} } }")
      end
    end

  # this method takes all the data from the third stage of listing of a property on the wizard.
    def stage3(jsonData, stage, current_user, propertyID)
      #if jsonData["property_id"] == nil then
      #  return JSON.parse('{ "result": "Error", "message": "Invalid property ID" }');
      #end

      if current_user.properties.exists?(propertyID) != true then 
        return JSON.parse('{ "result": "Error", "message": "Invalid property ID" }')
      end

      property = current_user.properties.find(propertyID)
      property.price = jsonData["price"]
      property.property_type = jsonData["property_type"]
      property.number_of_floors = jsonData["number_of_floors"]
      property.entrance_floor = jsonData["entrance_floor"]
      property.condition = jsonData["condition"]
      property.number_of_bedrooms = jsonData["number_of_bedrooms"]
      property.number_of_bathrooms = jsonData["number_of_bathrooms"]
      property.number_of_receptions = jsonData["number_of_receptions"]
      property.number_of_other_rooms = jsonData["number_of_other_rooms"]
      property.save

      return JSON.parse("{ \"result\": \"Success\", \"message\": \"Data saved\", \"data\": { \"property_id\": #{property.id.to_s} } }")
    end
  # this method takes all the data from the fourth stage of listing of a property on the wizard.
    def stage4(jsonData, stage, current_user, propertyID)
      #if jsonData["property_id"] == nil then
      #  return JSON.parse('{ "result": "Error", "message": "Invalid property ID" }');
      #end

      if current_user.properties.exists?(propertyID) != true then 
        return JSON.parse('{ "result": "Error", "message": "Invalid property ID" }')
      end

      property = current_user.properties.find(propertyID)
      property.outdoor_space = jsonData["outdoor_space"]
      property.save
      return JSON.parse("{ \"result\": \"Success\", \"message\": \"Data saved\", \"data\": { \"property_id\": #{property.id.to_s} } }")
    end

  # this method takes all the data from the fifth stage of listing of a property on the wizard.
    def stage5(jsonData, stage, current_user, propertyID)
      #if jsonData["property_id"] == nil then
      #  return JSON.parse('{ "result": "Error", "message": "Invalid property ID" }');
      #end

      if current_user.properties.exists?(propertyID) != true then 
        return JSON.parse('{ "result": "Error", "message": "Invalid property ID" }')
      end

      property = current_user.properties.find(propertyID)
      property.parking = jsonData["parking"]
      property.save
      return JSON.parse("{ \"result\": \"Success\", \"message\": \"Data saved\", \"data\": { \"property_id\": #{property.id.to_s} } }")
    end
  # this method takes all the data from the sixth stage of listing of a property on the wizard.
    def stage6(jsonData, stage, current_user, propertyID)
      #if jsonData["property_id"] == nil then
      #  return JSON.parse('{ "result": "Error", "message": "Invalid property ID" }');
      #end

      if current_user.properties.exists?(propertyID) != true then 
        return JSON.parse('{ "result": "Error", "message": "Invalid property ID" }')
      end

      property = current_user.properties.find(propertyID)
      property.heating = jsonData["heating"]
      property.save
      return JSON.parse("{ \"result\": \"Success\", \"message\": \"Data saved\", \"data\": { \"property_id\": #{property.id.to_s} } }")
    end
  # this method takes all the data from the seventh stage of listing of a property on the wizard.
    def stage7(jsonData, stage, current_user, propertyID)
      #TODO: Upload multimedia still, probably as a seperate method idk

      #if jsonData["property_id"] == nil then
      #  return JSON.parse('{ "result": "Error", "message": "Invalid property ID" }');
      #end

      if current_user.properties.exists?(propertyID) != true then 
        return JSON.parse('{ "result": "Error", "message": "Invalid property ID" }')
      end

      property = current_user.properties.find(propertyID)

      if jsonData["room_id"] == nil then
        room = Room.new
        room.property_id = property.id

        room.room_type = jsonData["title"]
        room.room_length = jsonData["length"]
        room.room_width = jsonData["width"]
        room.measurement_unit = jsonData["units"]
        room.description = jsonData["description"]
        room.save
        return JSON.parse("{ \"result\": \"Success\", \"message\": \"Data saved\", \"data\": { \"property_id\": #{property.id.to_s}, \"room_id\": #{room.id} } }")
      else
        if property.rooms.exists?(jsonData["room_id"]) != true then 
          return JSON.parse('{ "result": "Error", "message": "Invalid room ID" }')
        end

        room = property.rooms.find(jsonData["room_id"])
        room.room_type = jsonData["title"]
        room.room_length = jsonData["length"]
        room.room_width = jsonData["width"]
        room.measurement_unit = jsonData["units"]
        room.description = jsonData["description"]
        room.save
        return JSON.parse("{ \"result\": \"Success\", \"message\": \"Data saved\", \"data\": { \"property_id\": #{property.id.to_s}, \"room_id\": #{room.id} } }")
      end


    end
  # this method takes all the data from the eigth stage of listing of a property on the wizard.
    def stage8(jsonData, stage, current_user, propertyID)
      #if jsonData["property_id"] == nil then
      #  return JSON.parse('{ "result": "Error", "message": "Invalid property ID" }');
      #end

      if current_user.properties.exists?(propertyID) != true then 
        return JSON.parse('{ "result": "Error", "message": "Invalid property ID" }')
      end

      property = current_user.properties.find(propertyID)
      property.keyword = jsonData["keywords"]
      property.save
      return JSON.parse("{ \"result\": \"Success\", \"message\": \"Data saved\", \"data\": { \"property_id\": #{property.id.to_s} } }")
    end
  # this method takes all the data from the ninth stage of listing of a property on the wizard.
    def stage9(jsonData, stage, current_user, propertyID)
      #if jsonData["property_id"] == nil then
      #  return JSON.parse('{ "result": "Error", "message": "Invalid property ID" }');
      #end

      if current_user.properties.exists?(propertyID) != true then 
        return JSON.parse('{ "result": "Error", "message": "Invalid property ID" }')
      end

      property = current_user.properties.find(propertyID)
      property.description = jsonData["description"]
      property.save
      return JSON.parse("{ \"result\": \"Success\", \"message\": \"Data saved\", \"data\": { \"property_id\": #{property.id.to_s} } }")
    end

    def stage10(jsonData, stage, current_user, propertyID)
      #if jsonData["property_id"] == nil then
      #  return JSON.parse('{ "result": "Error", "message": "Invalid property ID" }');
      #end

      if current_user.properties.exists?(propertyID) != true then 
        return JSON.parse('{ "result": "Error", "message": "Invalid property ID" }')
      end

      property = current_user.properties.find(propertyID)
      property.status = "active"
      property.save
      return JSON.parse("{ \"result\": \"Success\", \"message\": \"Data saved\", \"data\": { \"property_id\": #{property.id.to_s} } }")
    end
end
