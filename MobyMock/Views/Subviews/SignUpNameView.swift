//
//  SignUpNameView.swift
//  MobyMock
//
//  Created by Wentao on 1/25/21.
//

import SwiftUI

struct SignUpNameView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var user: UserModel

    
    var body: some View {
        
        NavigationView {
            
            ScrollView{
                VStack {
                    Text("What's your name?")
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    VStack{
                        TextField("First Name", text: $user.firstName)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .font(.headline)
                            .autocapitalization(.sentences)
                        
                        Divider()
                        
                        TextField("Last Name", text: $user.lastName)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .font(.headline)
                            .autocapitalization(.sentences)
                    }
                }
                .padding()

                Spacer()
                
//                Button(action: {
//                    SignUpPhoneView()
//                }, label: {
//                    Text("NEXT")
//                        .frame(height: 50)
//                        .frame(maxWidth: .infinity)
//                        .background(Color.MyTheme.tealColor)
//                        .font(.system(size: 20, weight: .bold, design: .default))
//                        .foregroundColor(.white)
//                })
                NavigationLink(
                    destination: SignUpPhoneView(),
                    label: {
                        Text("NEXT")
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(Color.MyTheme.tealColor)
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .foregroundColor(.white)
                    })
                
                
            }
            .navigationBarTitle("Name", displayMode: .inline)
            .navigationBarItems(leading:
                                    Button(action: {
                                        presentationMode.wrappedValue.dismiss()
                                    }, label: {
                                        Image("xButton")
                                    })
                                    .accentColor(.black)
            )
            
        }
    }
}

struct SignUpNameView_Previews: PreviewProvider {
    
//    var user = UserModel()
    
    static var previews: some View {
        SignUpNameView()
            .previewLayout(.sizeThatFits)
    }
}
