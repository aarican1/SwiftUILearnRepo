//
//  WeatherView.swift
//  SwiftUI-WeatherApp
//
//  Created by Abdurrahman Arıcan on 1.03.2025.
//

import SwiftUI

struct WeatherView: View {
    @State private var isNight: Bool    = false
    @StateObject var viewModel          = WeatherViewModel()
    
    var body: some View {
        ZStack{
            BackgroundView( isNight:$viewModel.isNight )
                
            VStack{
                CityTextView(cityName: viewModel.locationTitle)
                
                WeatherStatusView( ImageName: viewModel.currentTimeWeather?.weatherImageName ?? "sparkles", tempratuare:viewModel.currentTimeWeather?.temp2m ?? 15
                )
                
                
            
                ScrollView(.vertical, showsIndicators: false) {
                    VStack (spacing:10){
                        ForEach(viewModel.weekWeatherList) { day in
                            WeatherDayView(
                                dayofWeek: day.dayName, imageSystemName: day.imageName, tempatuare:day.temperature
                            )
                        }
                    }
                }
                
                Spacer()
                
                Text("Data spulied by 7timer Api")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundStyle(.white)
            }
            
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .onAppear  {
            Task{
                await  viewModel.fetchWeatherInfo()
            }
       
        }
    }
}

#Preview {
    WeatherView()
}
