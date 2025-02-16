//
//  StringExtensions.swift
//  Appitizers
//
//  Created by Abdurrahman Arıcan on 21.01.2025.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicte =  NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicte.evaluate(with: self)
    }
    
    
}
