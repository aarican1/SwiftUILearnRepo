//
//  AppitizersApp.swift
//  Appitizers
//
//  Created by Abdurrahman Arıcan on 15.01.2025.
//

import SwiftUI

@main
struct AppitizersApp: App {
    
    var order  = Order()
    
    var body: some Scene {
        WindowGroup {
            AppitizerTabView().environmentObject(order)
        }
    }
}
