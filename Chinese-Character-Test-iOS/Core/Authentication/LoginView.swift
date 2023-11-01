//
//  LoginView.swift
//  Chinese-Character-Test-iOS
//
//  Created by Steven McVey on 11/1/23.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    var body: some View {
        NavigationStack {
            VStack {
                Image("CCT-logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 20)
                VStack(spacing: 24) {
                    InputView(text: $username,
                              title: "username",
                              placeholder: "input username")
                    .autocapitalization(.none)
                    
                    InputView(text: $password,
                              title: "password",
                              placeholder: "input password",
                              isSecureField: true
                    )
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                Button {
                    print("Log user in...")
                } label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .cornerRadius(10)
                .padding(.top, 24)
                
                Spacer()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
