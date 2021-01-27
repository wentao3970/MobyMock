//
//  SignUpEmailAndPasswordView.swift
//  MobyMock
//
//  Created by Wentao on 1/25/21.
//

import SwiftUI

struct SignUpEmailAndPasswordView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var user: UserModel
    
    var body: some View {
        VStack {
            
            VStack {
                Text("Create your account with email and password")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                VStack{
                    TextField("Email", text: $user.email)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .font(.headline)
                        .autocapitalization(.sentences)
                    
                    Divider()
                    
                    TextField("Password", text: $user.password)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .font(.headline)
                        .autocapitalization(.sentences)
                }
            }
            .padding()
            
            Spacer()
            
            NavigationLink(
                destination: SignUpUploadPictureView(),
                label: {
                    Text("NEXT")
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.MyTheme.tealColor)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .foregroundColor(.white)
                })
                .navigationBarBackButtonHidden(true)
            
            
        }
        .navigationBarTitle("Email", displayMode: .inline)
        .navigationBarItems(leading:
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }, label: {
                                    Image("backButtonImage")
                                })
                                .accentColor(.black)
        )
    }
}

struct SignUpEmailAndPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpEmailAndPasswordView()
    }
}
