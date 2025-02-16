//
//  ContentView.swift
//  SwiftUI-WeatherApp
//
//  Created by Abdurrahman Arıcan on 29.06.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight: Bool = true
    
    var body: some View {
        ZStack{
            BackgroundView( isNight: $isNight)
                
            VStack{
               
                CityTextView(cityName: "Seyhan, Adana")
                
                MainWeatherStatusView( ImageName: isNight ? "moon.stars.fill" :"cloud.sun.fill", tempratuare: 25)
                
                
            
                HStack (spacing:10){
                    WheaterDayView(
                        dayofWeek: "Pazartesi", imageSystemName: "sun.max.fill", tempatuare: 25
                    )
                    WheaterDayView(
                        dayofWeek: "Salı", imageSystemName: "wind", tempatuare: 22
                    )
                    WheaterDayView(
                        dayofWeek: "Çarşamba", imageSystemName: "cloud.sun.fill", tempatuare: 27
                    )
                    WheaterDayView(
                        dayofWeek: "Perşembe", imageSystemName: "wind", tempatuare: 23
                    )
                    WheaterDayView(
                        dayofWeek: "Cuma", imageSystemName: "cloud.sun.fill", tempatuare: 25
                    )
                    
                }
                .padding(.bottom, 120)
                Button{
                    isNight.toggle()
                } label: {
                   ButtonLabelTextView(buttonText: "Change Day Time")
                    
                }
                
                Spacer()
                
            }
            
            
            
        }
    }
}

#Preview {
    ContentView()
}

struct WheaterDayView: View {
    
    var dayofWeek:String
    var imageSystemName : String
    var tempatuare : Int
    
    
    var body: some View {
        VStack{
            Text(dayofWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
             
            
            
            VStack(spacing: 6)  {
                Image(systemName: imageSystemName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                
                Text("\(tempatuare)°")
                    .font(.system(size: 28, weight: .medium))
                    .foregroundColor(.white)
            }
            
        
            
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
  
    
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue , isNight ? .gray : Color("ligthBlue")]), startPoint: .top , endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)
    }
}


struct CityTextView: View {
    var cityName: String
    
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
        
    }
}


struct MainWeatherStatusView: View{
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

struct ButtonLabelTextView: View {
    
    var buttonText: String
    
    var body: some View {
        Text(buttonText)
            .foregroundColor(.blue)
            
            .frame(width: 280 ,height: 50)
            .font(.system(size: 28 , weight: .semibold))
            .background(Color.white)
            .cornerRadius(12)
    }
}
