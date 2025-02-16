//
//  APButton.swift
//  Appitizers
//
//  Created by Abdurrahman Arıcan on 20.01.2025.
//

import SwiftUI

struct APButton: View {
    
    let title :LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 48 ,alignment: .center)
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(12)
    }
}

#Preview {
    APButton(title: "Test")
}
