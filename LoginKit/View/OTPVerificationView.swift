//
//  OTPVerificationView.swift
//  LoginKit
//
//  Created by Ravi Shah on 18/09/23.
//

import SwiftUI

struct OTPVerificationView: View {
    
    //MARK: View Properties
    @State var otpText: String = ""
    //MARK: -Keybord Status
    @FocusState private var isKeybordShowing: Bool
    
    var body: some View {
        
        HStack(spacing: 0){
            //MARK: Change Count On Based OTP TEXTBOX View
            ForEach(0..<6, id: \.self){ index in
                OtpTextBox(index)
            }
            
        }
        .background(content: {
            TextField("", text: $otpText.limit(6))
                .keyboardType(.numberPad)
                .textContentType(.oneTimeCode)
            //MARK: Hiding it out
                .frame(width: 1, height: 1)
                .opacity(0.001)
                .blendMode(.screen)
                .focused($isKeybordShowing)
        })
        .contentShape(Rectangle())
        .onTapGesture {
            isKeybordShowing.toggle()
        }
        .toolbar{
            ToolbarItem(placement: .keyboard, content: {
                Button("Done"){
                    isKeybordShowing.toggle()
                }
            })
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        
        //MARK: Stack End Here
    }
    //MARK: OTP Text Box
    @ViewBuilder
    func OtpTextBox(_ index: Int)-> some View{
        ZStack{
            if otpText.count > index{
                //MARK: Finding Char At INDEX
                let startIndex = otpText.startIndex
                let charIndex = otpText.index(startIndex, offsetBy: index)
                let charToString = String(otpText[charIndex])
                Text(charToString)
            }else{
                Text("")
            }
        }
        .frame(width: 45, height: 45)
        .background{
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .stroke(.gray,lineWidth: 0.45)
        }
        .frame(maxWidth: .infinity)
    }
}


//MARK: String Extentions
extension Binding where Value == String {
    func limit (_ length: Int)-> Self{
        if self.wrappedValue.count > length
        {
            DispatchQueue.main.async {
                self.wrappedValue =  String(self.wrappedValue.prefix(length))
            }
        }
        return self
    }
}
