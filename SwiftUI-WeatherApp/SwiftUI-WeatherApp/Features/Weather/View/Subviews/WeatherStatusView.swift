//
//  WeatherStatusView.swift
//  SwiftUI-WeatherApp
//
//  Created by Abdurrahman Arıcan on 1.03.2025.
//

import SwiftUI


struct WeatherStatusView: View{
    var ImageName: String
    var tempratuare: Int
    
    var body: some View{
        
        VStack(spacing: 12)  {
            Image(systemName: ImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 140, height: 140)
            
            Text("\(tempratuare)°")
                .font(.system(size: 72, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom, 40 )
    }
}

#Preview {
    WeatherStatusView(ImageName: "sun.max.fill", tempratuare: 15)
}
