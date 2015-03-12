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
      current_user.first_name = jsonData["first_name"]
      current_user.last_name = jsonData["last_name"]
      current_user.email = jsonData["email"]
      current_user.phone_number = jsonData["phone_number"]
      current_user.save
      return JSON.parse('{ "result": "Success", "message": "Data saved" }');
    when "2"
      property = Property.new
      address = Address.new
      property.address_id = address.id;
      property.save

      address.house_name_number = jsonData["house_name_number"]
      address.address_line_1 = jsonData["address_line_1"]
      address.address_line_2 = jsonData["address_line_2"]
      address.town_city = jsonData["city"]
      address.county = jsonData["county"]
      address.post_code = jsonData["postcode"]
      address.save
    when "3"

    when "4"

    when "5"

    when "6"

    when "7"

    when "8"

    when "9"

    else 
      return JSON.parse('{ "result": "Error", "message": "Invalid stage" }');
    end
  end
end
