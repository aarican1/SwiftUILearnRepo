//
//  XDismissButton.swift
//  Appitizers
//
//  Created by Abdurrahman Arıcan on 20.01.2025.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(Color.brandPrimary)
            
        }
    }
}

#Preview {
    XDismissButton()
}
