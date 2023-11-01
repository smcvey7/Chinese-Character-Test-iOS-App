//
//  User.swift
//  Chinese-Character-Test-iOS
//
//  Created by Steven McVey on 10/31/23.
//

import Foundation
import Combine

struct ClassGroup: Codable {
    let id: Int
    let name: String
    // Add other properties as needed
}

class User: ObservableObject, Decodable {
    @Published var id: Int = 0
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var first_name: String = ""
    @Published var last_name: String = ""
    @Published var country: String = ""
    @Published var school: String = ""
    @Published var admin: Bool = false
    @Published var role: String = ""
    @Published var class_groups: [ClassGroup] // Assuming class_groups is an array of strings

    enum CodingKeys: String, CodingKey {
        case id
        case username
        case email
        case first_name
        case last_name
        case country
        case school
        case admin
        case role
        case class_groups
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        username = try container.decode(String.self, forKey: .username)
        email = try container.decode(String.self, forKey: .email)
        first_name = try container.decode(String.self, forKey: .first_name)
        last_name = try container.decode(String.self, forKey: .last_name)
        country = try container.decode(String.self, forKey: .country)
        school = try container.decode(String.self, forKey: .school)
        admin = try container.decode(Bool.self, forKey: .admin)
        role = try container.decode(String.self, forKey: .role)
        if let classGroupStrings = try? container.decode([String].self, forKey: .class_groups) {
                    // If the JSON data contains an array of strings, you can handle it here.
                    // You might need to create ClassGroup objects based on these strings.
                    class_groups = classGroupStrings.map { ClassGroup(id: 0, name: $0) } // You should adjust this based on your data structure.
                } else {
                    // If the JSON data contains an array of ClassGroup objects, decode it directly.
                    class_groups = try container.decode([ClassGroup].self, forKey: .class_groups)
                }    }
}

class UserViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func getUser() -> User {
        return self.user
    }
    
    func setUser(user: User) {
        self.user = user
    }
}
