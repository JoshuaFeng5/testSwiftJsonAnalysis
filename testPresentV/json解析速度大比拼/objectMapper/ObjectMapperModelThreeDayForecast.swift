//
//	ObjectMapperModelThreeDayForecast.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class ObjectMapperModelThreeDayForecast : NSObject, NSCoding, Mappable{

	var conditions : String?
	var day : String?
	var temperature : Int?


	class func newInstance(map: Map) -> Mappable?{
		return ObjectMapperModelThreeDayForecast()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		conditions <- map["conditions"]
		day <- map["day"]
		temperature <- map["temperature"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         conditions = aDecoder.decodeObject(forKey: "conditions") as? String
         day = aDecoder.decodeObject(forKey: "day") as? String
         temperature = aDecoder.decodeObject(forKey: "temperature") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if conditions != nil{
			aCoder.encode(conditions, forKey: "conditions")
		}
		if day != nil{
			aCoder.encode(day, forKey: "day")
		}
		if temperature != nil{
			aCoder.encode(temperature, forKey: "temperature")
		}

	}

}