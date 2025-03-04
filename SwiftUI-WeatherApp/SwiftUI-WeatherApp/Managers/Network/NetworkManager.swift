//
//  NetworkManager.swift
//  SwiftUI-WeatherApp
//
//  Created by Abdurrahman Arıcan on 1.03.2025.
//

import Foundation
import Alamofire

class NetworkManager {
    
    private var baseURL  = "http://www.7timer.info/bin/api.pl"
    
    
    func fetchWeatherInfo(longitude: Double, latitude: Double, completion : @escaping (WeatherResponse?)->Void){
        
        let parameters : [String : Any] = [
            "lon"       : longitude,
            "lat"       : latitude,
            "ac"        : "0",
            "lang"      : "en",
            "unit"      : "metric",
            "output"    : "json",
            "tzshift"   : "0",
            "product"   : "civil"
        ]
        
        AF.request(baseURL, parameters: parameters)
            .validate()
            .responseDecodable(of:WeatherResponse.self) { response in
                switch response.result {
                case .success(let weatherResponse):
                    completion(weatherResponse)
        
                case .failure(_):
                    completion(nil)
            }
        }
    }
}
