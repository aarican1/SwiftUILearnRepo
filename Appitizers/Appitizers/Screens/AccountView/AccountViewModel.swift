//
//  AccountViewModel.swift
//  Appitizers
//
//  Created by Abdurrahman Arıcan on 21.01.2025.
//

import SwiftUI


final class AccountViewModel : ObservableObject {

    @Published var user : User = User(firstName: "", lastName: "", email: "", birthDay: Date(), extraNapkins: false, frequentRefills: false)
    @Published var alertItem : AlertItem?
    
    @AppStorage("user") private var userData: Data?
    
    
    // save user information
    func saveChanges(){
        
        guard isValidForm else{return}
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSucces
        }
        catch{
            alertItem = AlertContext.invalidUserData
        }
    }
    
    //retrieve user profile information
    func retrieveUser(){
        
        guard let userData = userData else {return }
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
            
          
        }
        catch{
            alertItem = AlertContext.invalidUserData
        }
        
    }
    
    
    // validation form
    var isValidForm : Bool {
        
        //isEmpty Control
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        // Email validatoion
        guard user.email.isValidEmail else{
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
  
}
