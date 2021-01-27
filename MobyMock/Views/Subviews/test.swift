//
//  test.swift
//  MobyMock
//
//  Created by Wentao on 1/26/21.
//

import SwiftUI

struct test: View {
    
    @Environment(\.presentationMode) var presentationMode    
    
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
