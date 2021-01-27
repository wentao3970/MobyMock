//
//  SignUpPhoneView.swift
//  MobyMock
//
//  Created by Wentao on 1/25/21.
//

import SwiftUI

struct SignUpPhoneView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var user: UserModel
    //    @Binding var phone: String
    //    @Binding var cardName: String
    
    var body: some View {
        VStack {
            VStack {
                Text("What's your phone?")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("We will send you a code to verify your phone.")
                    .font(.caption)
                
                TextField("Phone", text: $user.phone)
                    .keyboardType(.numberPad)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .font(.headline)
                    .autocapitalization(.sentences)
            }
            .padding()
            
            Spacer()
            
            NavigationLink(
                destination: SignUpCreditCardViewPart1(),
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
        .navigationBarTitle("Phone", displayMode: .inline)
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


struct SignUpPhoneView_Previews: PreviewProvider {
    
    //    @State var user = UserModel()
    
    static var previews: some View {
        SignUpPhoneView()
    }
}
