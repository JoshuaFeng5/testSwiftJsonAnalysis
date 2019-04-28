//
//	ObjectMapperModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class ObjectMapperModel : NSObject, NSCoding, Mappable{

	var age : Int?
	var location : String?
	var sex : Int?
	var threeDayForecast : [ObjectMapperModelThreeDayForecast]?
	var username : String?
	var weight : Float?


	class func newInstance(map: Map) -> Mappable?{
		return ObjectMapperModel()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		age <- map["age"]
		location <- map["location"]
		sex <- map["sex"]
		threeDayForecast <- map["three_day_forecast"]
		username <- map["username"]
		weight <- map["weight"]
		
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
         threeDayForecast = aDecoder.decodeObject(forKey: "three_day_forecast") as? [ObjectMapperModelThreeDayForecast]
         username = aDecoder.decodeObject(forKey: "username") as? String
         weight = aDecoder.decodeObject(forKey: "weight") as? Float

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
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