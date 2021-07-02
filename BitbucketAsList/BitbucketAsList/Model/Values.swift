/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Values : Codable {
	let scm : String?
	let website : String?
	let has_wiki : Bool?
	let uuid : String?
	let links : Links?
	let fork_policy : String?
	let full_name : String?
	let name : String?
	let project : Project?
	let language : String?
	let created_on : String?
	let mainbranch : Mainbranch?
	let workspace : Workspace?
	let has_issues : Bool?
	let owner : Owner?
	let updated_on : String?
	let size : Int?
	let type : String?
	let slug : String?
	let is_private : Bool?
	let description : String?

	enum CodingKeys: String, CodingKey {

		case scm = "scm"
		case website = "website"
		case has_wiki = "has_wiki"
		case uuid = "uuid"
		case links = "links"
		case fork_policy = "fork_policy"
		case full_name = "full_name"
		case name = "name"
		case project = "project"
		case language = "language"
		case created_on = "created_on"
		case mainbranch = "mainbranch"
		case workspace = "workspace"
		case has_issues = "has_issues"
		case owner = "owner"
		case updated_on = "updated_on"
		case size = "size"
		case type = "type"
		case slug = "slug"
		case is_private = "is_private"
		case description = "description"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		scm = try values.decodeIfPresent(String.self, forKey: .scm)
		website = try values.decodeIfPresent(String.self, forKey: .website)
		has_wiki = try values.decodeIfPresent(Bool.self, forKey: .has_wiki)
		uuid = try values.decodeIfPresent(String.self, forKey: .uuid)
		links = try values.decodeIfPresent(Links.self, forKey: .links)
		fork_policy = try values.decodeIfPresent(String.self, forKey: .fork_policy)
		full_name = try values.decodeIfPresent(String.self, forKey: .full_name)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		project = try values.decodeIfPresent(Project.self, forKey: .project)
		language = try values.decodeIfPresent(String.self, forKey: .language)
		created_on = try values.decodeIfPresent(String.self, forKey: .created_on)
		mainbranch = try values.decodeIfPresent(Mainbranch.self, forKey: .mainbranch)
		workspace = try values.decodeIfPresent(Workspace.self, forKey: .workspace)
		has_issues = try values.decodeIfPresent(Bool.self, forKey: .has_issues)
		owner = try values.decodeIfPresent(Owner.self, forKey: .owner)
		updated_on = try values.decodeIfPresent(String.self, forKey: .updated_on)
		size = try values.decodeIfPresent(Int.self, forKey: .size)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
		is_private = try values.decodeIfPresent(Bool.self, forKey: .is_private)
		description = try values.decodeIfPresent(String.self, forKey: .description)
	}

}