//
//  WeatherDayView.swift
//  SwiftUI-WeatherApp
//
//  Created by Abdurrahman Arıcan on 1.03.2025.
//

import SwiftUI

struct WeatherDayView: View {
    
    var dayofWeek:String
    var imageSystemName : String
    var tempatuare : Int
    

    var body: some View {
        HStack(spacing:32){
            
            Image(systemName: imageSystemName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                
            Text(dayofWeek)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
                .frame(width: 120)
             
           
            Text("\(tempatuare)°")
                .font(.system(size: 30, weight: .medium))
                .foregroundColor(.white)
        }
        .padding()
    }
}

#Preview {
    WeatherDayView(dayofWeek: "Tueesday test ", imageSystemName: "sun.max.fill", tempatuare: 15)
}
