//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by Abdurrahman Arıcan on 17.10.2024.
//

import SwiftUI

struct FrameworkGridView: View {
    @State var isListandGridView : Bool = true
    @StateObject var viewModel = FrameWorkGridViewModel()
    let columns : [GridItem]  = [GridItem(.flexible()),
                                 GridItem(.flexible()),
                                 GridItem(.flexible()),
    ]
    
    var body: some View {
        
        
        NavigationStack{
            VStack{
                ListAndGridButton(isListandGridView: $isListandGridView)
                if isListandGridView {
                    List{
                        ForEach(MockData.frameworks, id: \.id){ framework in
                               
                            NavigationLink(value: framework){
                                FrameworkHorizantolTitleView(framework: framework)
                            }
                          
                        
                        }
                   
                    }
                    .navigationTitle("🍎 Frameworks")
                    .navigationDestination(for: Framework.self){ framework in
                        FrameworkDetailView(framework: framework, isShowingDetailView: $viewModel.isShowingDetailView)
                        
                    }
                   
                   
                }
                  
                else
                {
                    
                    ScrollView{
                        
                        
                        LazyVGrid(columns: columns){
                            ForEach(MockData.frameworks, id: \.id){ framework in
                                FrameworkVerticalTitleView(framework: framework)
                                    .onTapGesture {
                                        viewModel.selectedFramework = framework
                                    }
                            }
                        }
                    }
                    .navigationTitle("🍎 Frameworks")
                    .sheet(isPresented: $viewModel.isShowingDetailView ){
                        FrameworkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework, isShowingDetailView: $viewModel.isShowingDetailView)
                    
                }
            }
            }
          
           
            }
        }
        
      
    }


#Preview {
    FrameworkGridView(isListandGridView:false )
}

