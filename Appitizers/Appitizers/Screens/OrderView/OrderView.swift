//
//  OrderView.swift
//  Appitizers
//
//  Created by Abdurrahman Arıcan on 15.01.2025.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order : Order
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    List{
                        ForEach(order.items){ appetizer in
                            AppitizersListCell(appitizers:appetizer)
                        }
                        .onDelete(perform: order.deleteItem)
                    }
                    .listStyle(.plain)
                    
                    Button {
                        print("order tapped")
                    } label: {
                        APButton(title: " $\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .padding(.bottom, 20)
                }
                .navigationTitle("🧾 Orders")
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items your order list.\n Please add an appetizer.")
                }
            }}}
    
    
    
}

#Preview {
    OrderView()
}
