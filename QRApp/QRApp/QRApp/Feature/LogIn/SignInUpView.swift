//
//  SignInView.swift
//  QRApp
//
//  Created by admin on 28.11.2023.
//

import SwiftUI

struct SignInUPView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isSignUp: Bool = false

    var body: some View {
        
        NavigationView {
            VStack {
                if isSignUp {
                    Text("Sign Up")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 20)
                    
                    // Additional sign-up fields can be added here
                    
                } else {
                    Text("Log In")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 20)
                    
                }

                Image("AppHomePageLogo")
                    .resizable()
                    .scaledToFit()
                
                
                TextField("Username", text: $username)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.bottom, 10)

                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.bottom, 20)
                if(isSignUp){
                    SecureField("confirmPassword", text: $confirmPassword)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.bottom, 20)
                }
                

                Button(action: {
                    // Implement login or signup action here
                    
                    
                }) {
                    Text(isSignUp ? "Sign Up" : "Log In")
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(8)
                      
                        
                }
                

                Spacer()

                HStack {
                    Text(isSignUp ? "Already have an account?" : "Don't have an account?")
                    
                        .foregroundColor(.secondary)
                    Button(action: {
                        withAnimation {
                            isSignUp.toggle()
                                
                                
                        }
                    }) {
                        Text(isSignUp ? "Log In" : "Sign Up")
                            .foregroundColor(.blue)
                        
                            
                    }
                    
                }
                .padding()
            }
            .padding()
        
        }
        .navigationTitle("Log In")
    }
}


#Preview {
    SignInUPView()
}
