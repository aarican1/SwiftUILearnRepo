//
//  ContentView.swift
//  SwiftUI-WeatherApp-2
//
//  Created by Abdurrahman Arıcan on 12.10.2024.
//

import SwiftUI


struct ContentView: View {
    
    @State private var isNight = false
    var weatherModel : WeatherModel = dummyWeatherInfo
    
    var body: some View {
        ZStack {
            GradientBackgroundView(
                isNight: isNight
            )
            VStack{
                
                CityTextView(cityText: weatherModel.locationName)
                
                WeatherValueView(imageSystemName: weatherModel.todayImagepath, temparatureValue: weatherModel.todayTemparature)
                
                Spacer()
                
                HStack(spacing: 16) {
                    ForEach(weatherModel.dayOfWeekList, id: \.dayName){
                        day in
                        WeatherDayView(dayofWeek: day.dayName, weatherImagePath: day.weatherImagePath, temparature: day.temparature)
                    }
                    
                   /* WeatherDayView(dayofWeek: "TUE", weatherImagePath: "sun.max.fill", temparature: 32)
                    WeatherDayView(dayofWeek: "WED", weatherImagePath: "cloud.sun.fill", temparature: 26)
                    WeatherDayView(dayofWeek: "THU", weatherImagePath: "cloud.fill", temparature: 24)
                    WeatherDayView(dayofWeek: "FRI", weatherImagePath: "cloud.rain.fill", temparature: 18)
                    WeatherDayView(dayofWeek: "SAT", weatherImagePath: "cloud.heavyrain.fill", temparature: 15)
                    WeatherDayView(dayofWeek: "SUN", weatherImagePath: "cloud.sun.rain.fill", temparature: 17)
                    WeatherDayView(dayofWeek: "MON", weatherImagePath: "cloud.sun.fill", temparature: 22)*/
                }
                
                Spacer()
                
                
                Button(action: {
                    print("Button clicked!")
                    isNight.toggle()
                }) {
                    ChangeOfTimeButton(title: "Change Day Time", backgorundColor: .white, textColor: .blue)
                    
                }
            
            
                Spacer()
            }
            
           // Color(.yellow).edgesIgnoringSafeArea(.all)
            
           
        }
       
        
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayofWeek : String
    var weatherImagePath : String
    var temparature : Int
    
    var body: some View {
        VStack{
            Text(dayofWeek)
                .font(.system(size: 16)).foregroundColor(.white)

            Image(systemName: weatherImagePath)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temparature)°")
                .font(.system(size: 24, weight: .medium)).foregroundColor(.white)
        }
    }
}

struct GradientBackgroundView: View {
   var isNight : Bool
   
    var body: some View {
        LinearGradient(stops:[Gradient.Stop(color: isNight ? .black : .blue, location: 0.4), Gradient.Stop(color:isNight ? .gray : Color("lightColor") ,location: 1),], startPoint: .bottomTrailing, endPoint: .topLeading).ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityText : String
    
    var body: some View {
        Text(cityText)
            .font(.system(size: 32, weight: .medium, design: .none)).foregroundColor(.white)
    }
}

struct WeatherValueView: View {
    var imageSystemName : String
    var temparatureValue : Int
    
    var body: some View {
        VStack(spacing: 8){
            Image(systemName:imageSystemName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height:180)
            
            Text("\(temparatureValue)°")
                .font(.system(size: 64, weight: .medium)).foregroundColor(.white)
        }
        .padding(.bottom , 40)
    }
}




struct ChangeOfTimeButton: View {
    var title : String
    var backgorundColor : Color
    var textColor : Color
    var body: some View {
       
            Text(title)
                .frame(width: 280, height: 50, alignment: .center)
                .background(backgorundColor)
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundColor(textColor)
                .cornerRadius(16)
            
        }
    }

