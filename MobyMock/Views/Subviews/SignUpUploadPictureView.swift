//
//  SignUpUploadPictureView.swift
//  MobyMock
//
//  Created by Wentao on 1/25/21.
//

import SwiftUI
import UIKit

struct SignUpUploadPictureView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var user: UserModel
    
    @State var showImagePicker: Bool = false
    @State var imageSelected: UIImage
    @State var sourceType: UIImagePickerController.SourceType = .camera
    @State var showPostImageView: Bool = false
    @State var profileImage: UIImage

    
    var body: some View {
        VStack {
            
            VStack {
                Text("Upload your profile picture")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("It is easier for driver to find you at the pickup location with a profile image. Tap on the image to take/select a photo.")
                    .font(.caption)
                
                Button(action: {
                    sourceType = UIImagePickerController.SourceType.photoLibrary
                    showImagePicker.toggle()
                }, label: {
                    Image(uiImage: profileImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .clipShape(Circle())
                        .padding()
                })
            }
            .padding()
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Text("DONE")
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.tealColor)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(.white)
            })
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarTitle("Profile", displayMode: .inline)
        .navigationBarItems(leading:
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }, label: {
                                    Image("backButtonImage")
                                })
                                .accentColor(.black)
        )
        .sheet(isPresented: $showImagePicker, onDismiss: segueToPostImageView, content: {
            ImagePicker(imageSelected: $imageSelected, sourceType: $sourceType)
        })
        
    }
    
    
    
    // MARK: FUNCTIONS
    
    func createProfile() {
        print("CREATE PROFILE NOW")
        AuthService.instance.createNewUserInDatabase(firstName: "", lastName: "", email: "", providerID: "", provider: "", profileImage: imageSelected) { (returnedUserID) in
            
            if let userID = returnedUserID {
                // SUCESS
                print("Successfully created new user in database")
                
                AuthService.instance.logInUserToApp(userID: userID) { (success) in
                    if success {
                        print("User logged in!")
                        // return to app
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        
                    } else {
                        print("Error logging in")
                        self.showError.toggle()
                    }
                }
                
            } else {
                // ERROR
                print("Error creating user in Database")
                self.showError.toggle()
            }
            
        }
    }
    
    func saveImage() {
        
        guard let userID = currentUserID else {
            return
        }
        // Update the UI of the profile
        self.profileImage = selectedImage
        
        // Update profile image in database
//        ImageManager.instance.uploadProfileImage(userID: userID, image: selectedImage)
        
//        self.showSuccessAlert.toggle()
    }
    
    
    func segueToPostImageView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            showPostImageView.toggle()
        }
    }
    
}

struct SignUpUploadPictureView_Previews: PreviewProvider {
    
//    @State var profileImage: UIImage = UIImage(named: "profilePlaceholder")!
    
    static var previews: some View {
        SignUpUploadPictureView(imageSelected: UIImage(named: "profilePlaceholder")!)
        
    }
}
