//
//  FrameaworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Abdurrahman Arıcan on 17.10.2024.
//

import SwiftUI

struct FrameworkDetailView: View {
    var framework : Framework
    @Binding var isShowingDetailView : Bool
    @State private var isShowingSafariView = false
    var body: some View {
      
        VStack{
            XDismissButton(isShowingDetailView: $isShowingDetailView)
           
            Spacer()
            FrameworkVerticalTitleView(framework: framework)
            Text(framework.description)
                .font(.callout)
                .padding()
            Spacer()
            
            Button{
                isShowingSafariView = true
            }label:{
                 Text("Learn More")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(width: 280, height: 50)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }
            .fullScreenCover(isPresented: $isShowingSafariView, content: {
                SafariView(url: (URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
                )})
                  Spacer()
           
        }
        
    }
}

#Preview {
    FrameworkDetailView(
        framework: MockData.sampleFramework, isShowingDetailView: .constant(false)
    )
}
