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
    @State private var role = "student"
    
    struct UserObject: Codable {
        let role: String
        let userInfo: UserInfo
    }
    
    struct UserInfo: Codable {
        let username: String
        let password: String
    }
    
    func sendLoginRequest(_ jsonData: Data){
        
        guard let url = URL(string: "https://www.chinesecharactertest.com/login") else {
            print("Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(print("Error: \(error)"))
            }else if let data = data{
                if let responseString = String(data: data, encoding: .utf8){
                    print("Response: \(responseString)")
                }
            }
        }
        task.resume()
    }
    
    var body: some View {
        Text("Please log in to get started")
        NavigationView {
            VStack {
//                Image("./Assets.xcassets/Images/logo192.png")
//                    .resizable()
//                    .frame(width: 100, height: 100)
//                    .padding(.bottom, 20)
                Section(header: Text("Role")){
                    Picker("I am a...", selection: $role){
                        Text("student").tag("student")
                        Text("teacher/researcher").tag("teacher")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding()
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button(action: {
                    let userInfo = UserInfo(username: username, password: password)
                    let userObject = UserObject(role: role, userInfo: userInfo)
                    
                    if let jsonData = try?
                        JSONEncoder().encode(userObject){
                        sendLoginRequest(jsonData)
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
                  Text("\(role)")
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
