//
//  ContentView.swift
//  Appitizers
//
//  Created by Abdurrahman Arıcan on 15.01.2025.
//

import SwiftUI

struct AppitizerTabView: View {
    var body: some View {
        TabView{
            AppitizersListView()
                .tabItem({
                    Image(systemName: "house")
                    Text("Home")
                })
            OrderView()
                .tabItem({
                    Image(systemName: "basket")
                    Text("Order")
                })
            AccountView()
                .tabItem({
                    Image(systemName: "person.crop.circle")
                    Text("Account")
                })

        }
        
        .accentColor(.brandPrimary)
    }
}

#Preview {
    AppitizerTabView()
}
