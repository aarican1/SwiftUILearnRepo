//
//  LoadingView.swift
//  SwiftUI-WeatherApp
//
//  Created by Abdurrahman Arıcan on 3.03.2025.
//

import SwiftUI

struct ActivityIndicator : UIViewRepresentable {
   
    
    
    func makeUIView(context: Context) -> UIActivityIndicatorView{
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor.blue
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}


struct LoadingView: View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ActivityIndicator()
        }
    }
}

#Preview {
    LoadingView()
}
