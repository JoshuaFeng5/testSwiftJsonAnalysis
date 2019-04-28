//
//	ExportStructCodableModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct ExportStructCodableModel : Codable {

	let age : Int?
	let location : String?
	let sex : Int?
	let threeDayForecast : [ExportStructCodableModelThreeDayForecast]?
	let username : String?
	let weight : Float?


	enum CodingKeys: String, CodingKey {
		case age = "age"
		case location = "location"
		case sex = "sex"
		case threeDayForecast = "three_day_forecast"
		case username = "username"
		case weight = "weight"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		age = try values.decodeIfPresent(Int.self, forKey: .age)
		location = try values.decodeIfPresent(String.self, forKey: .location)
		sex = try values.decodeIfPresent(Int.self, forKey: .sex)
		threeDayForecast = try values.decodeIfPresent([ExportStructCodableModelThreeDayForecast].self, forKey: .threeDayForecast)
		username = try values.decodeIfPresent(String.self, forKey: .username)
		weight = try values.decodeIfPresent(Float.self, forKey: .weight)
	}


}