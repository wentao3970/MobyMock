//
//  CreditCardPart1.swift
//  MobyMock
//
//  Created by Wentao on 1/25/21.
//

import SwiftUI

struct SignUpCreditCardViewPart1: View {
    
    @Environment(\.presentationMode) var presentationMode
    //    @Binding var cardName: String
    @EnvironmentObject var user: UserModel
    
    var body: some View {
        VStack {
            
            
            VStack {
                Text("What's your payment method")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("We need your credit card information to pay for the ride.")
                    .font(.caption)
                
                TextField("Name on card", text: $user.cardName)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .font(.headline)
                    .autocapitalization(.sentences)
            }
            .padding()
            
            Spacer()
            
            NavigationLink(
                destination: SignUpCreditCardViewPart2(),
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
        .navigationBarTitle("Credit Card / Part 1", displayMode: .inline)
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

struct CreditCardPart1_Previews: PreviewProvider {
    
    //    @State var user = UserModel()
    
    static var previews: some View {
        SignUpCreditCardViewPart1()
    }
}
