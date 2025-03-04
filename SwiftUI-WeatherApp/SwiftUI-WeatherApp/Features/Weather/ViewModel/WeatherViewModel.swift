    //
    //  WeatherViewModel.swift
    //  SwiftUI-WeatherApp
    //
    //  Created by Abdurrahman Arıcan on 1.03.2025.
    //

    import Foundation
    import CoreLocation

    class WeatherViewModel : ObservableObject {
        private let networkManager      = NetworkManager()
        private let locationManager     = LocationManager()
        private let weatherManager      = WeatherManager()
        private var location            : CLLocationCoordinate2D?
        @Published var locationTitle    : String = "Current Location"
        @Published var weatherResponse  : WeatherResponse?
        @Published var currentTimeWeather   : WeatherData?
        @Published var weekWeatherList      : [WeekDayWeatherModel] = []
        @Published var isNight              = false
        @Published var isLoading            = false
        
        
        private func setIsNight(){
            self.isNight = weatherManager.isNight()
        }
        
        
        private func setWeekWeatherDic(){
            guard let weatherResponse else { return }
            self.weekWeatherList =  weatherManager.setWeekWeatherDic(from: weatherResponse.dataseries)
        }
        

        private func setCurrentTimeWeather(){
            guard let weatherResponse else { return }
            self.currentTimeWeather =   weatherManager.setCurrentTimeWeather(from: weatherResponse.dataseries)
        }

        
        private func fetchLocation() async -> CLLocationCoordinate2D? {
            return await withCheckedContinuation { continuation in
                
                locationManager.checkIfLocationServicesIsEnabled()
                locationManager.onLocationUpdate    = { currentLocation in
                    self.locationManager.getAddressName(from: currentLocation) { city, neighborhood in
                    self.locationTitle              = (neighborhood != nil ? "\(neighborhood!),\(city!)": city) ?? "Current Location"
                    }
                    continuation.resume(returning: currentLocation.coordinate)
                }
            
                locationManager.onLocationError     = { error in
                    continuation.resume(returning: nil)
                }
            }
        }
        
        
        func fetchWeatherInfo() async {
            DispatchQueue.main.async{
                self.isLoading = true
            }
            if let location = await fetchLocation() {
                networkManager.fetchWeatherInfo(longitude: location.longitude, latitude: location.latitude) { weatherResponse in
                    guard let weatherResponse else{ return }
                    self.weatherResponse = weatherResponse
                    self.setCurrentTimeWeather()
                    self.setWeekWeatherDic()
                }
                
             
            } else {
               
            }
            DispatchQueue.main.async{
                self.isLoading = false
            }
        }
        
      
    }
