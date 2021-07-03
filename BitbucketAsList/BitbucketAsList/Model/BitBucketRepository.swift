import Foundation
struct BitBucketRepository : Codable {
	let pagelen : Int?
	let values : [Values]
	let next : String?

	enum CodingKeys: String, CodingKey {

		case pagelen = "pagelen"
		case values = "values"
		case next = "next"
	}

	init(from decoder: Decoder) throws {
		let data = try decoder.container(keyedBy: CodingKeys.self)
		pagelen = try data.decodeIfPresent(Int.self, forKey: .pagelen)
        values = try data.decodeIfPresent([Values].self, forKey: .values) ?? [Values].init()
		next = try data.decodeIfPresent(String.self, forKey: .next)
	}

}
