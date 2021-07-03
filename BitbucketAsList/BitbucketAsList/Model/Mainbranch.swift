import Foundation
struct Mainbranch : Codable {
	let type : String?
	let name : String?

	enum CodingKeys: String, CodingKey {

		case type = "type"
		case name = "name"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		name = try values.decodeIfPresent(String.self, forKey: .name)
	}

}
