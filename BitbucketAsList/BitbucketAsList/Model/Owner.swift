/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

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