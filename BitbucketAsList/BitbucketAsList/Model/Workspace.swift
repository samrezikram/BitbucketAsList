import Foundation
struct Workspace : Codable {
	let slug : String?
	let type : String?
	let name : String?
	let links : Links?
	let uuid : String?

	enum CodingKeys: String, CodingKey {

		case slug = "slug"
		case type = "type"
		case name = "name"
		case links = "links"
		case uuid = "uuid"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		links = try values.decodeIfPresent(Links.self, forKey: .links)
		uuid = try values.decodeIfPresent(String.self, forKey: .uuid)
	}

}
