//
//  Login.swift
//  LoginKit
//
//  Created by Ravi Shah on 16/09/23.
//

import SwiftUI

struct Login: View {
    @Binding var showSignup: Bool
    //MARK:  View Property
    
    @State private var emailId: String = ""
    @State private var password: String = ""
    
    var body: some View {
        //MARK: Login Text
        VStack(alignment: .leading, spacing: 15){
            Spacer(minLength: 0)
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.heavy)
            Text("Please sign in to continue")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            //MARK: Textfields
            VStack(spacing: 25){
                
                CustomTF(sfIcons: "at", hint: "Email-id", value: $emailId)
                
                CustomTF(sfIcons: "lock", hint: "Password", isPassword: true ,value: $password)
                    .padding(.top, 5)
                
                Button("Forgot password?", action: {
                    
                }).font(.callout)
                    .fontWeight(.heavy)
                    .tint(.accentColor)
                    .hSpacing(.trailing)
                
                //MARK: LoginButton
                GradientButton(titel: "Login", icon: "arrow.right", onClick: {
                    
                })
                .hSpacing(.trailing)
                //MARK: Desible Untill Datta Is Not Enterd In
                .disableWithOpacity(emailId.isEmpty || password.isEmpty)
                
            }.padding(.top, 20)
            
            
            Spacer(minLength: 0)
            
            HStack(spacing: 5){
                Text("Don't have an account?")
                    .foregroundStyle(.gray)
                Button("Signup", action: {
                    showSignup.toggle()
                })
                .fontWeight(.bold)
                .tint(.accentColor)
                
            }
            .font(.callout)
            .hSpacing()
        }
        .padding(.vertical ,15)
        .padding(.horizontal, 25)
        .toolbar(.hidden, for: .navigationBar)
        //MARK: Stack End Here
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
