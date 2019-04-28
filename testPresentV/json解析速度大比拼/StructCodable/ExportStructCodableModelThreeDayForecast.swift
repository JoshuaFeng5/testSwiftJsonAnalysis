//
//	ExportStructCodableModelThreeDayForecast.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct ExportStructCodableModelThreeDayForecast : Codable {

	let conditions : String?
	let day : String?
	let temperature : Int?


	enum CodingKeys: String, CodingKey {
		case conditions = "conditions"
		case day = "day"
		case temperature = "temperature"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		conditions = try values.decodeIfPresent(String.self, forKey: .conditions)
		day = try values.decodeIfPresent(String.self, forKey: .day)
		temperature = try values.decodeIfPresent(Int.self, forKey: .temperature)
	}


}