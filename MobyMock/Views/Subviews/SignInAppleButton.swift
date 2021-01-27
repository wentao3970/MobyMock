//
//  SignInAppleButton.swift
//  MobyMock
//
//  Created by Wentao on 1/22/21.
//

import Foundation
import SwiftUI
import AuthenticationServices

struct SignInAppleButton: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .black)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) { }
}
