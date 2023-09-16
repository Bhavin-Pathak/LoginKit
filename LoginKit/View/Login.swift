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
    @State private var showForgotPassword: Bool = false
    //MARK: Show reset view with conformactions
    @State private var showResetView: Bool = false
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
                    showForgotPassword.toggle()
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
        //MARK: Asking Email-iid for reset link send
        .sheet(isPresented: $showForgotPassword, content: {
            if #available(iOS 16.4, *){
                ForgotPassword(showResetView: $showResetView)
                    .presentationDetents([.height(300)])
                    .presentationCornerRadius(30)
            }else{
                ForgotPassword(showResetView: $showResetView)
                    .presentationDetents([.height(300)])
            }
        })
        .sheet(isPresented: $showResetView, content: {
            if #available(iOS 16.4, *){
                PasswordReset()
                    .presentationDetents([.height(350)])
                    .presentationCornerRadius(30)
            }else{
                PasswordReset()
                    .presentationDetents([.height(350)])
            }
        })
        //MARK: Stack End Here
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
