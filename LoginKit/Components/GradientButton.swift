//
//  GradientButton.swift
//  LoginKit
//
//  Created by Ravi Shah on 16/09/23.
//

import SwiftUI

struct GradientButton: View {
    
    var titel : String
    var icon: String
    var onClick: () -> ()
    
    var body: some View {
        //MARK: Buttton Property
        Button(action: onClick, label: {
            HStack(spacing: 8){
                Text(titel)
                Image(systemName: icon)
            }
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding(.vertical, 12)
            .padding(.horizontal, 25)
            .background(
                Capsule()
                .fill(LinearGradient(
                    gradient: Gradient(colors: [.accentColor, .teal]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                )
            )
        }
        )
        
    }
    //MARK: End View
}

struct GradientButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
