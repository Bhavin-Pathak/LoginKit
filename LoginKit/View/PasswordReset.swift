//
//  PasswordReset.swift
//  LoginKit
//
//  Created by Ravi Shah on 16/09/23.
//

import SwiftUI

struct PasswordReset: View {
    //MARK:  View Property

    @State private var password: String = ""
    @State private var Cpassword: String = ""
    
    @Environment (\.dismiss) private var dismiss
 
    var body: some View {
        //MARK: Login Text
        VStack(alignment: .leading, spacing: 15){
            //MARK: Back Button
            
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
          
            Text("Reset Password")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            //MARK: Textfields
            VStack(spacing: 25){
                CustomTF(sfIcons: "lock", hint: "Password", value: $password)
                
                CustomTF(sfIcons: "lock", hint: "Confirm Password", value: $Cpassword)
                    .padding(.top, 5)
                
                
                //MARK: SignupButton
                GradientButton(titel: "Continue", icon: "arrow.right", onClick: {
                    //MARK: Logic impliment here
                 
                })
                .hSpacing(.trailing)
                //MARK: Desible until data is not enterd in
                
                .disableWithOpacity(password.isEmpty || Cpassword.isEmpty)
                
            }.padding(.top, 20)
  
        }
        .padding(.vertical ,15)
        .padding(.horizontal, 25)
        //MARK: This Going to Be A Sheet
        .interactiveDismissDisabled()
        //MARK: Stack End Here
    }
}



struct PasswordReset_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
