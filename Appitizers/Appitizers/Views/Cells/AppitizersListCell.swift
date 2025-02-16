//
//  AppitizersListCell.swift
//  Appitizers
//
//  Created by Abdurrahman Arıcan on 17.01.2025.
//

import SwiftUI

struct AppitizersListCell: View {
    
    let appitizers : Appitizer
    var body: some View {
        HStack{
            AppetizersRemoteImage(urlString: appitizers.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90, alignment: .center)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5){
                Text(appitizers.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$ \(appitizers.price, specifier: "%.2f")")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
            }
        }
        .padding(.leading)
    }
}

#Preview {
    AppitizersListCell(appitizers: MockData.sampleAppitizers)
}
