//
//  WeatherManager.swift
//  SwiftUI-WeatherApp
//
//  Created by Abdurrahman Arıcan on 3.03.2025.
//

import Foundation
import UIKit

class WeatherManager {
    
    // Daily time points that represent the start and end times for each day in a week
    private let dailyTimePoints  = [(day: 1, start: 24, end: 48), (day: 2, start: 48, end: 72), (day: 3, start: 72, end: 96), (day: 4, start: 96, end: 120), (day: 5, start: 120, end: 144), (day: 6, start: 144, end: 168), (day: 8, start: 168, end: 192)]
    
    /// This function checks if the current time is considered night (6 PM or later, or before 6 AM)
    func isNight() -> Bool {
        let currentHour = Calendar.current.component(.hour, from: Date())
        let userInterfaceStyle = UIScreen.main.traitCollection.userInterfaceStyle
        if userInterfaceStyle == .dark || currentHour >= 18 || currentHour < 6 {
            return true
        } else {
            return false
        }
    }
    
    
    /// This function processes the weather data and returns a list of WeekDayWeatherModel
    /// - Parameter weatherDataList: A list of WeatherData objects that contain weather information for each time point
    /// - Returns: An array of WeekDayWeatherModel containing the most frequent weather image and the average temperature for each day
    func setWeekWeatherDic(from weatherDataList : [WeatherData]) -> [WeekDayWeatherModel] {
        var weeksDic = [String : [WeatherData]]()
        
        weatherDataList.forEach({ weatherData in
            for (day,start,end) in dailyTimePoints{
                if weatherData.timepoint > start && weatherData.timepoint < end {
                    let formattedDayName = getDayName(for: day )
                  
                    if weeksDic[formattedDayName] == nil {
                        weeksDic[formattedDayName]  = []
                    }
                    weeksDic[formattedDayName]?.append(weatherData)
                    
                }
            }
        })
        
        var result = [WeekDayWeatherModel]()
        
        weeksDic.forEach { (dayName, weatherDataList) in
            var avarageTemp                     = 0 //default temp value
            var sumImageName: [String : Int]    = [:]
            var mostFrequencyImageName          = ""
            var tempSum                         = 0
            
            weatherDataList.forEach { weatherData in
                tempSum                                                 +=  weatherData.temp2m
                sumImageName[weatherData.weatherImageName, default: 0 ] += 1
            }
            
            mostFrequencyImageName  = sumImageName.max(by: { $0.value < $1.value })?.key ?? weatherDataList.first?.weatherImageName ?? "sparkles"
            avarageTemp             = tempSum / weatherDataList.count
            result.append(WeekDayWeatherModel(id: dayName.dayIdValueByDayName, dayName: dayName, imageName: mostFrequencyImageName, temperature: avarageTemp))
        }
        
        return result.sorted { $0.id < $1.id }
        
    }
    
    
    ///This process  set currentTimeWeather by calcute  the difference between  first list value.timepoint and currentHour and returns the smallest one according to its  differences from second list value .timepoint and currentHour
    /// /// This function sets the current weather data by calculating the difference between the current hour and the timepoints
    /// - Parameter weatherDataList: A list of WeatherData objects containing weather data at different time points
    /// - Returns: The WeatherData object that is closest to the current time
    func setCurrentTimeWeather(from weatherDataList : [WeatherData])->WeatherData?{
        
        let currentHour = Calendar.current.component(.hour, from: Date())
        return  weatherDataList.min(by: { abs($0.timepoint-currentHour) < abs($1.timepoint-currentHour) })
    }
    
    
    /// This function gets the name of the day based on a number of days to add to the current date
    /// - Parameter daysAddTo: The number of days to add to the current date (positive or negative)
    /// - Returns: The name of the day as a string
    private func getDayName(for daysAddTo:Int)->String{
        let currentDay  = Date()
        let calendar    = Calendar.current
        
        if let newDate = calendar.date(byAdding: .day, value: daysAddTo, to: currentDay){
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE"
            let dayName = dateFormatter.string(from: newDate)
            
            return dayName
        }
            return "Unknown Day "
    }
    
}
