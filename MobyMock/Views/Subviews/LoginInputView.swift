//
//  LoginInputView.swift
//  MobyMock
//
//  Created by Wentao on 1/22/21.
//

import SwiftUI



struct LoginInputView: View {
    
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        VStack{
            TextField("Email", text: $email)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .font(.headline)
                .autocapitalization(.sentences)
            
            Divider()
            
            TextField("Password", text: $password)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .font(.headline)
                .autocapitalization(.sentences)
        }
        .padding()
        
        
        
    }
    
}

struct LoginInputView_Previews: PreviewProvider {
    
    @State static var emailTest: String = ""
    @State static var passwordTest: String = ""
    
    static var previews: some View {
        LoginInputView(email: $emailTest, password: $passwordTest)
            .previewLayout(.sizeThatFits)
    }
}
