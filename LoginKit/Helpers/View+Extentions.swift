//
//  View+Extentions.swift
//  LoginKit
//
//  Created by Ravi Shah on 16/09/23.
//

import SwiftUI

extension View {
    
    //MARK: View Alignment
    @ViewBuilder
    func hSpacing(_ alignment: Alignment = .center) -> some View {
        self.frame(maxWidth: .infinity, alignment: alignment)
    }
    
    @ViewBuilder
    func vSpacing(_ alignment: Alignment = .center) -> some View {
        self.frame(maxHeight: .infinity, alignment: alignment)
    }
    //MARK: Disable With Opacity
    func disableWithOpacity(_ Condition : Bool) -> some View {
        self.disabled(Condition)
            .opacity(Condition ? 0.5 :  1)
    }
    
}
