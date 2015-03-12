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

  def saveDraft(jsonData, stage)
    case stage
    when "1"
      user = User.find(jsonData.id)
      user.first_name = jsonData.first_name;
      user.last_name = jsonData.last_name;
      user.email = jsonData.email;
      user.phone_number = jsonData.phone_number;
      user.save
      return user.id
    when "2"

    when "3"

    when "4"

    when "5"

    when "6"

    when "7"

    when "8"

    when "9"

    else 
      return stage
    end

    return true
  end
end
