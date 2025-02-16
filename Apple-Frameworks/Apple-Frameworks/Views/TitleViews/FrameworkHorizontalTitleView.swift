//
//  FrameworkTitleView.swift
//  Apple-Frameworks
//
//  Created by Abdurrahman Arıcan on 19.10.2024.
//

import SwiftUI

struct FrameworkHorizantolTitleView : View {
    
    let framework : Framework
    
    var body: some View {
    
        HStack(){
            Image(framework.imageName)
                .resizable()
                .frame(width: 60,height: 60)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.bold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
        
    }
    
    
}


#Preview {
    FrameworkHorizantolTitleView(framework: MockData.sampleFramework)
}

