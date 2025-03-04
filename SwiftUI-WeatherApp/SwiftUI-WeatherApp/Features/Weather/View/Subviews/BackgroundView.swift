//
//  BackgroundView.swift
//  SwiftUI-WeatherApp
//
//  Created by Abdurrahman Arıcan on 1.03.2025.
//

import SwiftUI

struct BackgroundView: View {
    
    @Binding var isNight: Bool
  
    var body: some View {
            LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue , isNight ? .gray : Color("lightBlue")]), startPoint: .top , endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
        }
    }

#Preview {
    BackgroundView(isNight:  .constant(false))
}
