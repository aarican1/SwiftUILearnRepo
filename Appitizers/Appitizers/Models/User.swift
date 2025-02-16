//
//  User.swift
//  Appitizers
//
//  Created by Abdurrahman Arıcan on 21.01.2025.
//

import Foundation

struct User: Codable {
    var firstName      : String
    var lastName       : String
    var email          : String
    var birthDay      : Date
    var extraNapkins   : Bool
    var frequentRefills :Bool
}
