//
//  LoadingView.swift
//  Appitizers
//
//  Created by Abdurrahman Arıcan on 19.01.2025.
//

import SwiftUI

struct ActivityIndicator : UIViewRepresentable {
   
    
    
    func makeUIView(context: Context) -> UIActivityIndicatorView{
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor.brandPrimaryUI
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
                .ignoresSafeArea(.all)


            ActivityIndicator()
        }
    }
}
