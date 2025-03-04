//
//  String+Ext.swift
//  SwiftUI-WeatherApp
//
//  Created by Abdurrahman Arıcan on 3.03.2025.
//

extension String {
    var dayIdValueByDayName  : Int {
        switch self {
        case "Monday" :
            return 1
        case"Tuesday":
            return 2
        case "Wednesday":
            return 3
        case "Thursday":
            return 4
        case "Friday":
            return 5
        case "Saturday":
            return 6
        case "Sunday":
            return 7
        default:
            return  1
        }
        
    }
}
