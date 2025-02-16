//
//  AppetizersDetailView.swift
//  Appitizers
//
//  Created by Abdurrahman Arıcan on 20.01.2025.
//

import SwiftUI

struct AppetizersDetailView: View {
    
    @EnvironmentObject var order : Order
    
    let appetizer : Appitizer
    @Binding var isShowingDetail : Bool
    var body: some View {
        VStack{
            AppetizersRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 320,height: 200,alignment: .center)
                .cornerRadius(12)
                

            VStack{
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack{
                    NutritionInfo(title: "Calories", value: appetizer.caloires)
                    
                    Spacer()
                    
                    NutritionInfo(title: "Carbs", value: appetizer.carbs)
                    
                    Spacer()
                    
                    NutritionInfo(title: "Protein", value: appetizer.protein)
                    
                    
                }
            .padding(.horizontal, 40)
                
            }
            Spacer()
            Button{
                order.add(appetizer)
                isShowingDetail = false
            } label: {
                APButton(title: "$\(appetizer.price,specifier: "%.2f") - Add to Order   ")
                   
            }
            .padding(.bottom,30)
            
            
        }
        .frame(width: 320, height: 525, alignment: .center)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button{
            isShowingDetail = false
           
        } label : {
            XDismissButton()
            
        }, alignment: .topTrailing)
    }
}

#Preview {
    AppetizersDetailView(appetizer: MockData.sampleAppitizers ,isShowingDetail:.constant(true) )
}


struct NutritionInfo : View {
    let title : String
    let value : Int
    
    var body : some View {
        
        VStack(spacing: 8){
            Text(title)
                .font(.caption)
                .bold()
           
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
        
    }
}
