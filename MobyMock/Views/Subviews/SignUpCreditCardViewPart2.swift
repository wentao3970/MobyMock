//
//  CreditCardViewPart2.swift
//  MobyMock
//
//  Created by Wentao on 1/25/21.
//

import SwiftUI

struct SignUpCreditCardViewPart2: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var user: UserModel
    @State var showCamera: Bool = false
    
    var body: some View {
        VStack {
            VStack {
                Text("What's your payment method?")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("We need your credit card information to pay for the ride.")
                    .font(.caption)
            }
            .padding()
            
            Spacer()
            
            NavigationLink(
                destination: SignUpEmailAndPasswordView(),
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
        .navigationBarTitle("credit Card / Part2", displayMode: .inline)
        .navigationBarItems(leading:
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }, label: {
                                    Image("backButtonImage")
                                })
                                .accentColor(.black),
                            trailing: Button(action: {
                                showCamera.toggle()
                            }, label: {
                                Image(systemName: "camera")
                            })
        )
    }
}

struct CreditCardViewPart2_Previews: PreviewProvider {
    static var previews: some View {
        SignUpCreditCardViewPart2()
    }
}
