//
//	ExportStructModelThreeDayForecast.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct ExportStructModelThreeDayForecast{

	var conditions : String!
	var day : String!
	var temperature : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		conditions = dictionary["conditions"] as? String
		day = dictionary["day"] as? String
		temperature = dictionary["temperature"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if conditions != nil{
			dictionary["conditions"] = conditions
		}
		if day != nil{
			dictionary["day"] = day
		}
		if temperature != nil{
			dictionary["temperature"] = temperature
		}
		return dictionary
	}

}