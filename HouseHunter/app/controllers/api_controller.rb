class ApiController < ApplicationController
  
  def sendProperty(jsonData)
    return true
  end

  def removeProperty(propertyId)
    return true
  end

  def getBranchPropertyList(branchId)
    return true
  end

  def addPremiumListing(jsonData)
    return true
  end

  def addFeaturedProperty(jsonData)
    return true
  end

  def removeFeaturedProperty(propertyId)
    return true
  end

  def saveDraft(jsonData, stage, current_user)
    case stage
      when "1"
        stage1(jsonData, stage, current_user)
      when "2"
        stage2(jsonData, stage, current_user)
      when "3"
        stage3(jsonData, stage, current_user)
      when "4"
        stage4(jsonData, stage, current_user)
      when "5"
        stage5(jsonData, stage, current_user)
      when "6"
        stage6(jsonData, stage, current_user)
      when "7"
        stage7(jsonData, stage, current_user)
      when "8"
        stage8(jsonData, stage, current_user)
      when "9"
        stage9(jsonData, stage, current_user)
      else 
        return JSON.parse('{ "result": "Error", "message": "Invalid stage" }')
    end
  end

  private
    def stage1(jsonData, stage, current_user)
      current_user.first_name = jsonData["first_name"]
      current_user.last_name = jsonData["last_name"]
      current_user.email = jsonData["email"]
      current_user.phone_number = jsonData["phone_number"]
      current_user.save
      return JSON.parse('{ "result": "Success", "message": "Data saved" }')
    end

    def stage2(jsonData, stage, current_user)
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
        property = Property.new
        address = Address.new
        property.save
        address.save

        address.property_id = property.id
        property.user_id = current_user.id
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

    def stage3(jsonData, stage, current_user)
      if jsonData["property_id"] == nil then
        return JSON.parse('{ "result": "Error", "message": "Invalid property ID" }');
      end

      if current_user.properties.exists?(jsonData["property_id"]) != true then 
        return JSON.parse('{ "result": "Error", "message": "Invalid property ID" }')
      end

      property = current_user.properties.find(jsonData["property_id"])
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

    def stage4(jsonData, stage, current_user)
      if jsonData["property_id"] == nil then
        return JSON.parse('{ "result": "Error", "message": "Invalid property ID" }');
      end

      if current_user.properties.exists?(jsonData["property_id"]) != true then 
        return JSON.parse('{ "result": "Error", "message": "Invalid property ID" }')
      end

      property = current_user.properties.find(jsonData["property_id"])
      property.outdoor_space = jsonData["outdoor_space"]
      property.save
      return JSON.parse("{ \"result\": \"Success\", \"message\": \"Data saved\", \"data\": { \"property_id\": #{property.id.to_s} } }")
    end

    def stage5(jsonData, stage, current_user)
      if jsonData["property_id"] == nil then
        return JSON.parse('{ "result": "Error", "message": "Invalid property ID" }');
      end

      if current_user.properties.exists?(jsonData["property_id"]) != true then 
        return JSON.parse('{ "result": "Error", "message": "Invalid property ID" }')
      end

      property = current_user.properties.find(jsonData["property_id"])
      property.parking = jsonData["parking"]
      property.save
      return JSON.parse("{ \"result\": \"Success\", \"message\": \"Data saved\", \"data\": { \"property_id\": #{property.id.to_s} } }")
    end

    def stage6(jsonData, stage, current_user)
      if jsonData["property_id"] == nil then
        return JSON.parse('{ "result": "Error", "message": "Invalid property ID" }');
      end

      if current_user.properties.exists?(jsonData["property_id"]) != true then 
        return JSON.parse('{ "result": "Error", "message": "Invalid property ID" }')
      end

      property = current_user.properties.find(jsonData["property_id"])
      property.heating = jsonData["heating"]
      property.save
      return JSON.parse("{ \"result\": \"Success\", \"message\": \"Data saved\", \"data\": { \"property_id\": #{property.id.to_s} } }")
    end

    def stage7(jsonData, stage, current_user)
      if jsonData["property_id"] == nil then
        return JSON.parse('{ "result": "Error", "message": "Invalid property ID" }');
      end

      if current_user.properties.exists?(jsonData["property_id"]) != true then 
        return JSON.parse('{ "result": "Error", "message": "Invalid property ID" }')
      end

      property = current_user.properties.find(jsonData["property_id"])

      if jsonData["room_id"] == nil then
        room = Room.new
        room.property_id = property.id

        room.room_type = jsonData["room_type"]
        room.room_length = jsonData["room_length"]
        room.room_width = jsonData["room_width"]
        room.measurement_unit = jsonData["measurement_unit"]
        room.description = jsonData["description"]
        room.save
        return JSON.parse("{ \"result\": \"Success\", \"message\": \"Data saved\", \"data\": { \"property_id\": #{property.id.to_s}, \"room_id\": #{room.id} } }")
      else
        if property.rooms.exists?(jsonData["room_id"]) != true then 
          return JSON.parse('{ "result": "Error", "message": "Invalid room ID" }')
        end

        room = property.rooms.find(jsonData["room_id"])
        room.room_type = jsonData["room_type"]
        room.room_length = jsonData["room_length"]
        room.room_width = jsonData["room_width"]
        room.measurement_unit = jsonData["measurement_unit"]
        room.description = jsonData["description"]
        room.save
        return JSON.parse("{ \"result\": \"Success\", \"message\": \"Data saved\", \"data\": { \"property_id\": #{property.id.to_s}, \"room_id\": #{room.id} } }")
      end


    end

    def stage8(jsonData, stage, current_user)

    end

    def stage9(jsonData, stage, current_user)

    end
end
