//
//  AuthService.swift
//  MobyMock
//
//  Created by Wentao on 1/26/21.
//

// Used to Authenticate users in Firebase
// Used to handle User accounts in Firebase

import Foundation
import Firebase
import FirebaseFirestore // Database

let DB_BASE = Firestore.firestore()

class AuthService {
    
    // MARK: PROPERTIES
    
    static let instance = AuthService()
    private var REF_USERS = DB_BASE.collection("users")
    
    
    // MARK: AUTH USER FUNCTIONS
    
    func logInUserToApp(userID: String, handler: @escaping (_ success: Bool) -> ()) {
        
//        // Get the users info
//        getUserInfo(forUserID: userID) { (returnedName, returnedBio) in
//            if let name = returnedName, let bio = returnedBio {
//                // Success
//                print("Success getting user info while logging in")
//                handler(true)
//
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                    // Set the users info into our app
//                    UserDefaults.standard.set(userID, forKey: CurrentUserDefaults.userID)
//                    UserDefaults.standard.set(bio, forKey: CurrentUserDefaults.bio)
//                    UserDefaults.standard.set(name, forKey: CurrentUserDefaults.displayName)
//                }
//
//            } else {
//                // Error
//                print("Error getting user info while logging in")
//                handler(false)
//            }
//        }
    }
    
    
    
    func createNewUserInDatabase(firstName: String, lastName: String, email: String, providerID: String, provider: String, profileImage: UIImage, handler: @escaping (_ userID: String?) -> ()) {
        
        // Set up a user Document with the user Collection
        let document = REF_USERS.document()
        let userID = document.documentID
        
        // Upload profile image to Storage
        ImageManager.instance.uploadProfileImage(userID: userID, image: profileImage)
        
        // Upload profile data to Firestore
        let userData : [String: Any] = [
            DatabaseUserField.firstName : firstName,
            DatabaseUserField.lastName : lastName,
            DatabaseUserField.email : email,
            DatabaseUserField.providerID : providerID,
            DatabaseUserField.provider : provider,
            DatabaseUserField.userID : userID,
            DatabaseUserField.dateCreated : FieldValue.serverTimestamp(),
        ]
        
        document.setData(userData) { (error) in
            if let error = error {
                //Error
                print("Error uploading data to user document. \(error)")
                handler(nil)
            } else {
                // Success
                handler(userID)
            }
        }
    }
}
