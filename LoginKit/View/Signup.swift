//
//  Signup.swift
//  LoginKit
//
//  Created by Ravi Shah on 16/09/23.
//

import SwiftUI

struct Signup: View {
    @Binding var showSignup: Bool
    //MARK:  View Property
    
    @State private var emailId: String = ""
    @State private var contact: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    
    var body: some View {
        //MARK: Login Text
        VStack(alignment: .leading, spacing: 15){
            //MARK: Back Button
            
            Button(action: {
                showSignup = false
            }, label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
          
            Text("Signup")
                .font(.largeTitle)
                .fontWeight(.heavy)
            Text("Please signup to continue")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            //MARK: Textfields
            VStack(spacing: 25){
                
                CustomTF(sfIcons: "person", hint: "Full-Name", value: $fullName)
             
                CustomTF(sfIcons: "star", hint: "Contact-Number", value: $contact)
                
                CustomTF(sfIcons: "at", hint: "Email-id", value: $emailId)
                
                CustomTF(sfIcons: "lock", hint: "Password", isPassword: true ,value: $password)
                    .padding(.top, 5)
                
                //MARK: SignupButton
                GradientButton(titel: "Continue", icon: "arrow.right", onClick: {
                    
                })
                .hSpacing(.trailing)
                //MARK: Desible until data is not enterd in
                
                .disableWithOpacity(emailId.isEmpty || password.isEmpty || fullName.isEmpty || contact.isEmpty)
                
            }.padding(.top, 20)
            
            
            Spacer(minLength: 0)
            
            HStack(spacing: 5){
                Text("Already have an account?")
                    .foregroundStyle(.gray)
                Button("Login", action: {
                    showSignup =  false
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

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
