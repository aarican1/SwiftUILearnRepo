//
//  Appitizers.swift
//  Appitizers
//
//  Created by Abdurrahman Arıcan on 16.01.2025.
//

import Foundation

struct Appitizer : Decodable, Identifiable {
    
    let id : Int
    let name: String
    let description : String
    let imageURL : String
    let price : Double
    let protein : Int
    let caloires : Int
    let carbs : Int
}
 
struct AppitizersResponse : Decodable {
    let request : [Appitizer]
}


struct MockData {
    static let  sampleAppitizers  = Appitizer(id: 0001,
                                              name: "Test Apetizers", description: "test Appetizers Testtest Appetizers Testtest Appetizers Testtest Appetizers Test" ,
                                              imageURL: "https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                                              price: 12.2,
                                              protein: 14,
                                              caloires: 114,
                                              carbs: 5)
    
    
    static let sampleAppitizersResponse : [Appitizer] = [sampleAppitizers,sampleAppitizers,sampleAppitizers,sampleAppitizers]

    static let orderItemOne = Appitizer(id: 0001,
                                       name: "Test Apetizers 1", description: "test Appetizers Testtest Appetizers Testtest Appetizers Testtest Appetizers Test" ,
                                       imageURL: "https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                                       price: 12.2,
                                       protein: 14,
                                       caloires: 114,
                                       carbs: 5)
    static let orderItemTwo = Appitizer(id: 0002,
                                       name: "Test Apetizers 2", description: "test Appetizers Testtest Appetizers Testtest Appetizers Testtest Appetizers Test" ,
                                       imageURL: "https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                                       price: 12.2,
                                       protein: 14,
                                       caloires: 114,
                                       carbs: 5)
    static let orderItemThree = Appitizer(id: 0003,
                                       name: "Test Apetizer 3s", description: "test Appetizers Testtest Appetizers Testtest Appetizers Testtest Appetizers Test" ,
                                       imageURL: "https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                                       price: 12.2,
                                       protein: 14,
                                       caloires: 114,
                                       carbs: 5)
    
    static let orderList = [orderItemOne,orderItemTwo, orderItemThree]
    
    
}
