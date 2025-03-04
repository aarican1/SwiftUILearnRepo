//
//  WeatherData+Ext.swift
//  SwiftUI-WeatherApp
//
//  Created by Abdurrahman Arıcan on 1.03.2025.
//

import Foundation

extension WeatherData {
    
    // Cloud Cover'ı string olarak döndürür
    // returns the Cloud cover as a String
    var cloudCoverDescription: String {
        switch cloudcover {
        case 0...6:
            return "Clear"
        case 7...8:
            return "Partly Cloudy"
        case 9:
            return "Cloudy"
        default:
            return "Undefined"
        }
    }
    
    // Lifted Index'i string olarak döndürür
    // returns the Lifted Index as a String
    var liftedIndexDescription: String {
        switch liftedIndex {
        case Int.min..<(-7):
            return "Below -7"
        case -7...(-5):
            return "-7 to -5"
        case -5...(-3):
            return "-5 to -3"
        case -3...0:
            return "-3 to 0"
        case 0...4:
            return "0 to 4"
        case 4...8:
            return "4 to 8"
        case 8...11:
            return "8 to 11"
        case 11...:
            return "Over 11"
        default:
            return "Undefined"
        }
    }
    
    // 2m Sıcaklık açıklamasını döndürür
    // returns the Temperature as a String
    var temperatureDescription: String {
        switch temp2m {
        case -76...60:
            return "Temperature: \(temp2m)°C"
        default:
            return "Temperature undefined"
        }
    }
    
    // 2m Nem yüzdesi açıklamasını döndürür
    // returns the humidity as a String
    var humidityDescription: String {
        return "Humidity: \(rh2m)%"
    }
    
    // Rüzgar hızına göre açıklama döndürür
    // returns the wind as a String
    var windDescription: String {
        switch wind10m.speed {
                case 1:
                    return "Calm (Below 1.08 km/s)"
                case 2:
                    return "Light (1.08-12.24 km/s)"
                case 3:
                    return "Moderate (12.24-28.80 km/s)"
                case 4:
                    return "Fresh (28.80-38.88 km/s)"
                case 5:
                    return "Strong (38.88-61.92 km/s)"
                case 6:
                    return "Gale (61.92-88.32 km/s)"
                case 7:
                    return "Storm (88.32-117.36 km/s)"
                case 8:
                    return "Hurricane (Over 117.36 km/s)"
                default:
                    return "Wind speed undefined"
                }
    }
    
    // Yağış tipini string olarak döndürür
    // returns the Precipitation Type as a String
    var precipitationTypeDescription: String {
        guard let precType = precType else { return "No precipitation" }
        
        switch precType {
        case "snow":
            return "Snow"
        case "rain":
            return "Rain"
        case "frzr":
            return "Freezing Rain"
        case "icep":
            return "Ice Pellets"
        case "none":
            return "No Precipitation"
        default:
            return "Undefined Precipitation"
        }
    }
    
    // Genel hava durumu açıklaması
    // returns the weather as a String
    var weatherImageName: String {
        switch weather {
        case "clearday":
        return "sun.max.fill"
    case "clearnight":
        return "moon.stars"
    case "pcloudyday":
        return "cloud.sun.fill"
    case "pcloudynight":
        return "cloud.moon"
    case "mcloudyday":
        return "cloud.fill"
    case "mcloudynight":
        return "cloud.fill"
    case "cloudyday":
        return "cloud.fill"
    case "cloudynight":
        return "cloud.fill"
    case "humidday":
        return "humidity.fill"
    case "humidnight":
        return "humidity.fill"
    case "lightrainday":
        return "cloud.rain.fill"
    case "lightrainnight":
        return "cloud.rain.fill"
    case "oshowerday":
        return "cloud.drizzle.fill"
    case "oshowernight":
        return "cloud.drizzle.fillt"
    case "ishowerday":
        return "cloud.drizzle.fill"
    case "ishowernight":
        return "cloud.drizzle.fill"
    case "lightsnowday":
        return "cloud.snow.fill"
    case "lightsnownight":
        return "cloud.snow.fill"
    case "rainday":
        return "cloud.heavyrain.fill"
    case "rainnight":
        return "cloud.heavyrain.fill"
    case "snowday":
        return "cloud.snow.fill"
    case "snownight":
        return "cloud.snow.fill"
    case "rainsnowday":
        return "cloud.sleet.fill"
    case "rainsnownight":
        return "cloud.sleet.fill"
    case "tsday":
        return "cloud.bolt.fill"
    case "tsnight":
        return "cloud.bolt.fill"
    case "tsrainday":
        return "cloud.bolt.rain.fill"
    case "tsrainnight":
        return "cloud.bolt.rain.fill"
    default:
        return "sparkles"
        }
    }
}
