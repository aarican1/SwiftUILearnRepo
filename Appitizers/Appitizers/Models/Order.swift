//
//  Order.swift
//  Appitizers
//
//  Created by Abdurrahman Arıcan on 21.01.2025.
//

import SwiftUI

final class Order : ObservableObject {
    
    @Published var items : [Appitizer] = []
    
    
    var totalPrice : Double {
        items.reduce(0){ $0 + $1.price}
            
        }
    
    
    
    
    func add(_ appetizer : Appitizer){
        items.append(appetizer)
    }
    
    func deleteItem(_ atOffset : IndexSet){
        items.remove(atOffsets: atOffset)
    }
}
