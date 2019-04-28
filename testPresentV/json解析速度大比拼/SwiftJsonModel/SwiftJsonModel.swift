//
//	SwiftJsonModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class SwiftJsonModel : NSObject, NSCoding{

	var age : Int!
	var location : String!
	var sex : Int!
	var threeDayForecast : [SwiftJsonModelThreeDayForecast]!
	var username : String!
	var weight : Float!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		age = json["age"].intValue
		location = json["location"].stringValue
		sex = json["sex"].intValue
		threeDayForecast = [SwiftJsonModelThreeDayForecast]()
		let threeDayForecastArray = json["three_day_forecast"].arrayValue
		for threeDayForecastJson in threeDayForecastArray{
			let value = SwiftJsonModelThreeDayForecast(fromJson: threeDayForecastJson)
			threeDayForecast.append(value)
		}
		username = json["username"].stringValue
		weight = json["weight"].floatValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if age != nil{
			dictionary["age"] = age
		}
		if location != nil{
			dictionary["location"] = location
		}
		if sex != nil{
			dictionary["sex"] = sex
		}
		if threeDayForecast != nil{
			var dictionaryElements = [[String:Any]]()
			for threeDayForecastElement in threeDayForecast {
				dictionaryElements.append(threeDayForecastElement.toDictionary())
			}
			dictionary["three_day_forecast"] = dictionaryElements
		}
		if username != nil{
			dictionary["username"] = username
		}
		if weight != nil{
			dictionary["weight"] = weight
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         age = aDecoder.decodeObject(forKey: "age") as? Int
         location = aDecoder.decodeObject(forKey: "location") as? String
         sex = aDecoder.decodeObject(forKey: "sex") as? Int
         threeDayForecast = aDecoder.decodeObject(forKey: "three_day_forecast") as? [SwiftJsonModelThreeDayForecast]
         username = aDecoder.decodeObject(forKey: "username") as? String
         weight = aDecoder.decodeObject(forKey: "weight") as? Float

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if age != nil{
			aCoder.encode(age, forKey: "age")
		}
		if location != nil{
			aCoder.encode(location, forKey: "location")
		}
		if sex != nil{
			aCoder.encode(sex, forKey: "sex")
		}
		if threeDayForecast != nil{
			aCoder.encode(threeDayForecast, forKey: "three_day_forecast")
		}
		if username != nil{
			aCoder.encode(username, forKey: "username")
		}
		if weight != nil{
			aCoder.encode(weight, forKey: "weight")
		}

	}

}
