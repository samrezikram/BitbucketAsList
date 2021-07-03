import Foundation
struct Clone : Codable {
	let href : String?
	let name : String?

	enum CodingKeys: String, CodingKey {

		case href = "href"
		case name = "name"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		href = try values.decodeIfPresent(String.self, forKey: .href)
		name = try values.decodeIfPresent(String.self, forKey: .name)
	}

}
