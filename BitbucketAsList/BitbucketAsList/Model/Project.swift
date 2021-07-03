import Foundation
struct Project : Codable {
	let links : Links?
	let type : String?
	let name : String?
	let key : String?
	let uuid : String?

	enum CodingKeys: String, CodingKey {

		case links = "links"
		case type = "type"
		case name = "name"
		case key = "key"
		case uuid = "uuid"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		links = try values.decodeIfPresent(Links.self, forKey: .links)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		key = try values.decodeIfPresent(String.self, forKey: .key)
		uuid = try values.decodeIfPresent(String.self, forKey: .uuid)
	}

}
