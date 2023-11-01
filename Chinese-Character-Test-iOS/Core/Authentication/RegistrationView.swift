//
//  RegistrationView.swift
//  Chinese-Character-Test-iOS
//
//  Created by Steven McVey on 11/1/23.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var username = ""
    @State private var password = ""
    @State private var password_confirmation = ""
    @State private var email = ""
    @State private var first_name = ""
    @State private var last_name = ""
    @State private var first_language = ""
    @State private var other_L2 = ""
    @State private var country = ""
    @State private var school = ""
    @State private var age = 18
    @State private var class_learning = 0
    @State private var home_learning = 0
    @State private var other_info = ""
    @State private var class_UUID = ""
    @State private var isPartOfClass = true

    
    var body: some View {
        NavigationStack{
            Image("CCT-logo")
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.bottom, 20)
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            }
            
            ScrollView{
                VStack(spacing: 24) {
                    InputView(text: $class_UUID,
                              title: "class code",
                              placeholder: "enter class code")
                    
                    NavigationLink {
                        QRScannerView()
                    } label: {
                            Text("Scan QR")
                                .fontWeight(.bold)
                                .font(.system(size: 14))
                    }
                    
                    InputView(text: $email,
                              title: "email",
                              placeholder: "name@example.com")
                    InputView(text: $username,
                              title: "username",
                              placeholder: "username")
                    .autocapitalization(.none)
                    
                    InputView(text: $password,
                              title: "password",
                              placeholder: "password",
                              isSecureField: true
                    )
                    InputView(text: $password_confirmation,
                              title: "confirm password",
                              placeholder: "password",
                              isSecureField: true
                    )
                    InputView(text: $first_name,
                              title: "first name",
                              placeholder: "first name")
                    InputView(text: $last_name,
                              title: "last name",
                              placeholder: "last name")
                    InputView(text: $class_UUID,
                              title: "class code",
                              placeholder: "enter class code")
                    InputView(text: $first_language,
                              title: "first langauge",
                              placeholder: "first language")
                    InputView(text: $other_L2,
                              title: "other languages spoken",
                              placeholder: "list any languages spoken")
                    InputView(text: $school,
                              title: "school",
                              placeholder: "school name")
                    NumberInputView(content: $age, minVal: 10, maxVal: 100, label: "age")
                    NumberInputView(content: $class_learning, minVal: 0, maxVal: 100, label: "Years spent learning Chinese in a formal class")
                    NumberInputView(content: $home_learning, minVal: 0, maxVal: 100, label: "Years spent learning Chinese independently (at home)")
                    
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                Button {
                    print("Sign user up...")
                } label: {
                    HStack {
                        Text("SIGN UP")
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
                
            }
            }
        }
        
        
        
}

#Preview {
    RegistrationView()
}
