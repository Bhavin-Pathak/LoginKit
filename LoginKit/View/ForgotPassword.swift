//
//  ForgotPassword.swift
//  LoginKit
//
//  Created by Ravi Shah on 16/09/23.
//

import SwiftUI

struct ForgotPassword: View {
    @Binding var showResetView: Bool
    //MARK:  View Property

    @State private var emailId: String = ""
    @Environment (\.dismiss) private var dismiss
 
    var body: some View {
        //MARK: Login Text
        VStack(alignment: .leading, spacing: 15){
            //MARK: Back Button
            
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
          
            Text("Forgot Password")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            Text("Enter Your Email Id To Send Verification Code")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            //MARK: Textfields
            VStack(spacing: 25){
                

                
                CustomTF(sfIcons: "at", hint: "Email-id", value: $emailId)
                
              
                //MARK: SignupButton
                GradientButton(titel: "SendLink", icon: "arrow.right", onClick: {
                    //MARK: Logic impliment here
                    Task{
                        dismiss()
                        try? await Task.sleep(for: .seconds(0))
                        showResetView = true
                    }
                })
                .hSpacing(.trailing)
                //MARK: Desible until data is not enterd in
                
                .disableWithOpacity(emailId.isEmpty)
                
            }.padding(.top, 20)
  
        }
        .padding(.vertical ,15)
        .padding(.horizontal, 25)
        //MARK: This Going to Be A Sheet 
        .interactiveDismissDisabled()
        //MARK: Stack End Here
    }
}


struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
