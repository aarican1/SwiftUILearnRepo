//
//  WeatherResponse.swift
//  SwiftUI-WeatherApp
//
//  Created by Abdurrahman Arıcan on 1.03.2025.
//

import Foundation

struct WeatherResponse: Codable {
    let product: String
    let initTime: String
    let dataseries: [WeatherData]
    
    enum CodingKeys: String, CodingKey {
        case product
        case initTime = "init"
        case dataseries
    }
}

struct WeatherData: Codable {
    let timepoint: Int       // Tahminin hangi zaman noktasına ait olduğu
    let cloudcover: Int      // Bulut örtüsü (0-9)
    let liftedIndex: Int     // Konveksiyon indeksi (fırtına olasılığı için)
    let rh2m: String            // 2m seviyesindeki nem yüzdesi
    let wind10m: Wind        // 10m seviyesindeki rüzgar bilgisi
    let weather: String      // Hava durumu açıklaması (örn. "cloudy", "rain")
    let temp2m: Int          // 2m seviyesindeki sıcaklık (°C)
    let precType: String?    // Yağış türü (örn. "rain", "snow", "none")

    enum CodingKeys: String, CodingKey {
        case timepoint, cloudcover, rh2m, wind10m, weather, temp2m
        case liftedIndex = "lifted_index"
        case precType = "prec_type"
    }
}

struct Wind: Codable {
    let direction: String    // Rüzgar yönü ("N", "NE", "E", "SE", vb.)
    let speed: Int          // Rüzgar hızı (1-12 arası)
}
