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
      user = User.find(jsonData.data.id)
      user.first_name = jsonData.data.first_name;
      user.last_name = jsonData.data.last_name;
      user.email = jsonData.data.email;
      user.phone_number = jsonData.data.phone_number;
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
