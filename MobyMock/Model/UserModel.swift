//
//  UserModel.swift
//  MobyMock
//
//  Created by Wentao on 1/25/21.
//

import Foundation

class UserModel: ObservableObject {
    
    @Published var firstName = ""
    @Published var lastName = ""
    
    @Published var phone = ""
    
    @Published var cardName = ""
    @Published var cardNumber = ""
    @Published var cardExpireDate = ""
    @Published var cardCVC = ""
    
    @Published var email = ""
    @Published var password = ""
    
//    init(firstName: String, lastName: String, phone: String, email: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//        self.phone = phone
//        self.email = email
//    }
//
    
}
