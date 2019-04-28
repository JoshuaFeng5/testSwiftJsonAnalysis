//
//	ExportStructModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct ExportStructModel{

	var age : Int!
	var location : String!
	var sex : Int!
	var threeDayForecast : [ExportStructModelThreeDayForecast]!
	var username : String!
	var weight : Float!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		age = dictionary["age"] as? Int
		location = dictionary["location"] as? String
		sex = dictionary["sex"] as? Int
		threeDayForecast = [ExportStructModelThreeDayForecast]()
		if let threeDayForecastArray = dictionary["three_day_forecast"] as? [[String:Any]]{
			for dic in threeDayForecastArray{
				let value = ExportStructModelThreeDayForecast(fromDictionary: dic)
				threeDayForecast.append(value)
			}
		}
		username = dictionary["username"] as? String
		weight = dictionary["weight"] as? Float
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

}