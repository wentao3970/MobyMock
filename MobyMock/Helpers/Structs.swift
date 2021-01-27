//
//  Structs.swift
//  MobyMock
//
//  Created by Wentao on 1/26/21.
//

import Foundation

struct DatabaseUserField { // Fields within the User Document in Database
    
    static let firstName = "first_name"
    static let lastName = "last_name"
    static let email = "email"
    static let providerID = "provider_id"
    static let provider = "provider"
    static let userID = "user_id"
    static let dateCreated = "date_created"
    
}


struct CurrentUserDefaults { // Fields for UserDefaults saved within app
    
    static let displayName = "display_name"
    static let bio = "bio"
    static let userID = "user_id"
    
}
