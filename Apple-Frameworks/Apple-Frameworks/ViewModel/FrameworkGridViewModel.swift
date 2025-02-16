//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by Abdurrahman Arıcan on 19.10.2024.
//

import SwiftUI

final class FrameWorkGridViewModel : ObservableObject {
    
    var selectedFramework : Framework?{
        didSet{
            isShowingDetailView = true
        }
        
    }
    
    @Published var isShowingDetailView : Bool = false
}
