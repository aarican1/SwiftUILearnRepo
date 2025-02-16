//
//  FrameworkVerticalşTitleView.swift
//  Apple-Frameworks
//
//  Created by Abdurrahman Arıcan on 22.10.2024.
//

import SwiftUI

struct FrameworkVerticalTitleView : View {
    
    let framework : Framework
    
    var body: some View {
    
        VStack(){
            Image(framework.imageName)
                .resizable()
                .frame(width: 90,height: 90)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.bold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }.padding()
    }
    
    
}


#Preview {
    FrameworkVerticalTitleView(framework: MockData.sampleFramework)
}

