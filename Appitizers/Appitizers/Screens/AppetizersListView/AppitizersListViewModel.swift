//
//  AppitizersListViewModel.swift
//  Appitizers
//
//  Created by Abdurrahman Arıcan on 17.01.2025.
//

import SwiftUI

final class AppitizersListViewModel : ObservableObject {
    
    @Published var appetizers : [Appitizer]  = []
    @Published var alertItem  : AlertItem?
    @Published var isLoading : Bool = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer : Appitizer?
    
    
    
    // Get Appetizers method call in NetworkManager.shared
    func getAppetizers(){
        isLoading  = true
        NetworkManager.shared.getAppetizers { result in
            
            DispatchQueue.main.async {
                
                self.isLoading = false
                
                switch result{
                
                case .success(let appetizers):
                    self.appetizers = appetizers
                    
                case .failure(let error):
                    switch error{
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        break
                        
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        break
                    
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        break
                    
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                        break
                    }
               
                }
            }}
    
    }
    
    
 
    
}
