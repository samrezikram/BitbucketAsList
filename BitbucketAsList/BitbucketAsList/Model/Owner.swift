import Foundation
struct Owner : Codable {
	let display_name : String?
	let uuid : String?
	let links : Links?
	let type : String?
	let nickname : String?
	let account_id : String?

	enum CodingKeys: String, CodingKey {

		case display_name = "display_name"
		case uuid = "uuid"
		case links = "links"
		case type = "type"
		case nickname = "nickname"
		case account_id = "account_id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		display_name = try values.decodeIfPresent(String.self, forKey: .display_name)
		uuid = try values.decodeIfPresent(String.self, forKey: .uuid)
		links = try values.decodeIfPresent(Links.self, forKey: .links)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		nickname = try values.decodeIfPresent(String.self, forKey: .nickname)
		account_id = try values.decodeIfPresent(String.self, forKey: .account_id)
	}

}
