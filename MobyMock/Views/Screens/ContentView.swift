//
//  ContentView.swift
//  MobyMock
//
//  Created by Wentao on 1/22/21.
//

import SwiftUI
import FirebaseAuth


struct ContentView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var showSignUp: Bool = false
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var phone: String = ""
    @State var cardName: String = ""
    
    
    @StateObject private var user = UserModel()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            // Contains login_background image and LoginInputView
            VStack (spacing: -90){
                Image("login_background")
                    .resizable()
                    .scaledToFit()
                
                VStack {
                    LoginInputView(email: $email, password: $password)
                }
                .background(Color.white)
                .padding()
                .shadow(radius: 10.0)
            }
            
            Spacer()
            
            // Contains the footer login buttons
            VStack (spacing: 20) {
                Spacer()
                
                // MARK: SIGN IN WITH APPLE ID
                Button(action: {
                    
                }, label: {
                    SignInAppleButton()
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(5)
                })
                
                // MARK: SIGN IN WITH Email
                Button(action: {
                    
                }, label: {
                    HStack {
                        Text("Login with Email")
                    }
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.tealColor)
                    .cornerRadius(5)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(.white)
                })
                
                // MARK: SIGN UP
                Button(action: {
                    showSignUp.toggle()
                }, label: {
                    Text("New user? SIGN UP")
                        .font(.headline)
                        .fontWeight(.medium)
                        .padding()
                })
                .accentColor(.black)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding()
        }
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $showSignUp, content: {
            SignUpNameView()
                .environmentObject(user)
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
