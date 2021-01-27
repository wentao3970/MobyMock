//
//  MobyMockApp.swift
//  MobyMock
//
//  Created by Wentao on 1/22/21.
//

import SwiftUI
import FirebaseCore

@main
struct MobyMockApp: App {
    
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
