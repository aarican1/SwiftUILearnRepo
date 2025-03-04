//
//  CityTextView.swift
//  SwiftUI-WeatherApp
//
//  Created by Abdurrahman Arıcan on 1.03.2025.
//

import SwiftUI

struct CityTextView: View {
    var cityName: String
    
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .lineLimit(1)
            .truncationMode(.tail)
            .foregroundColor(.white)
            .padding()
        
    }
}

#Preview {
    CityTextView(cityName: "Seyhan")
}
