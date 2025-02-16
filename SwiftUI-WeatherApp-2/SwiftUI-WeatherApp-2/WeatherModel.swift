//
//  WeatherModel.swift
//  SwiftUI-WeatherApp-2
//
//  Created by Abdurrahman Arıcan on 15.10.2024.
//

import Foundation

var dummyWeatherInfo = WeatherModel(locationName: "Karabucak, Antalya", dayOfWeekList: [
    DayOfWeek(dayName: "TUE", temparature: 28, weatherImagePath: "cloud.sun.fill"),
    DayOfWeek(dayName: "WED", temparature: 24, weatherImagePath:"sun.max.fill"),
    DayOfWeek(dayName: "THR", temparature: 22, weatherImagePath: "cloud.sun.fill"),
    DayOfWeek(dayName: "FRI", temparature: 20, weatherImagePath: "cloud.sun.rain.fill"),
    DayOfWeek(dayName: "SAT", temparature: 18, weatherImagePath:"cloud.heavyrain.fill"),
    DayOfWeek(dayName: "SUN", temparature: 18, weatherImagePath: "cloud.sun.rain.fill")],
    todayTemparature: 24,
    todayImagepath: "cloud.sun.fill")



class WeatherModel{
    var locationName : String
    var dayOfWeekList : [DayOfWeek]
    var todayTemparature : Int
    var todayImagepath : String
    
    init(locationName: String, dayOfWeekList: [DayOfWeek], todayTemparature: Int, todayImagepath: String) {
        self.locationName = locationName
        self.dayOfWeekList = dayOfWeekList
        self.todayTemparature = todayTemparature
        self.todayImagepath = todayImagepath
    }

  
}

struct DayOfWeek {
    var dayName : String
    var temparature: Int
    var weatherImagePath : String
}
