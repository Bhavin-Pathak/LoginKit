//
//  CustomTF.swift
//  LoginKit
//
//  Created by Ravi Shah on 16/09/23.
//

import SwiftUI

struct CustomTF: View {
    
    var sfIcons: String
    var iconTint: Color = .gray
    var hint: String
    //MARK: Hide TextFields
    var isPassword: Bool = false
    @Binding var value : String
    //MARK: Show Password
    @State private var showPassword : Bool = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 8, content: {
            Image(systemName: sfIcons)
                .foregroundStyle(iconTint)
            //MARK: Need Some Alignment To Arrange Text fields
                .frame(width: 30)
                .offset(y: 2)
            //MARK: Textfield Stack
            VStack(alignment: .leading,spacing: 8,content: {
                
                if isPassword{
                    Group{
                        //MARK: Revival password when user want to show their password
                        if showPassword{
                            TextField(hint, text: $value)
                        }else{
                            SecureField(hint, text: $value)
                        }
                    }
                }else{
                    TextField(hint, text: $value)
                }
                Divider()
            })
            .overlay(alignment: .trailing){
                if isPassword{
                    Button(action: {
                        withAnimation{
                            showPassword.toggle()
                        }
                    }, label: {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                            .foregroundStyle(.gray)
                            .padding(10)
                    })
                }else{
                    
                }
            }
        })
    }
    //MARK: View END HERE
}

