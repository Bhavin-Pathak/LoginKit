//
//  OTPView.swift
//  LoginKit
//
//  Created by Ravi Shah on 18/09/23.
//

import SwiftUI

struct OTPView: View {
    @Binding var otpText: String
    //MARK:  View Property

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
          
            Text("Enter OTP")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            Text("Enter 6 digit OTP we have send it on your email")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            //MARK: Textfields
            VStack(spacing: 25){
                //MARK: Custom OTP TextField
                OTPVerificationView(otpText: otpText)
                
                //MARK: SignupButton
                GradientButton(titel: "Verify", icon: "arrow.right", onClick: {
                    //MARK: Logic impliment here
                 
                })
                .hSpacing(.trailing)
                //MARK: Desible until data is not enterd in
                .disableWithOpacity(otpText.isEmpty)
                
                
            }.padding(.top, 20)
  
        }
        .padding(.vertical ,15)
        .padding(.horizontal, 25)
        //MARK: This Going to Be A Sheet
        .interactiveDismissDisabled()
        //MARK: Stack End Here
    }
}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
