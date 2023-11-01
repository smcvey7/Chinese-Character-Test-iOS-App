//
//  Login.swift
//  Chinese-Character-Test-iOS
//
//  Created by Steven McVey on 10/31/23.
//

import SwiftUI

struct Login: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isLogged = false
    
    var body: some View {
        Text("Please log in to get started")
        NavigationView {
            VStack {
//                Image("./Assets.xcassets/Images/logo192.png")
//                    .resizable()
//                    .frame(width: 100, height: 100)
//                    .padding(.bottom, 20)
//                
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button(action: {
                    if username == "admin" && password == "password" {
                        isLogged = true
                    }
                }) {
                    Text("Log In")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                
                if isLogged {
                  Text("Logged in successfully!")
                      .foregroundColor(.green)
                }
                Spacer()
            }
            .padding()
            .navigationBarTitle("Login")
        }
        
    }
    
}

#Preview {
    Login()
}
