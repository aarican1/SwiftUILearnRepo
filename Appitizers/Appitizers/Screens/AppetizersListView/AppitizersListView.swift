//
//  AppitizersListView.swift
//  Appitizers
//
//  Created by Abdurrahman Arıcan on 15.01.2025.
//

import SwiftUI

struct AppitizersListView: View {
    @StateObject  var viewModel : AppitizersListViewModel  = AppitizersListViewModel()
   
    
    
    var body: some View {
        
        ZStack{
            NavigationView{
                List(viewModel.appetizers ,id:\.id ){ appitizers in
                    
                    AppitizersListCell(appitizers: appitizers)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appitizers
                            viewModel.isShowingDetail = true
                        }
                    
                }
                .navigationTitle("🍟 Appitizers")
                .disabled( viewModel.isShowingDetail)
            }
            .onAppear{
                viewModel.getAppetizers()
            }
            .blur(radius:  viewModel.isShowingDetail ? 20 : 0)
            
            if  viewModel.isShowingDetail{
                AppetizersDetailView(appetizer: viewModel.selectedAppetizer ?? MockData.sampleAppitizers, isShowingDetail: $viewModel.isShowingDetail)
                    
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        
        }
        .alert(item : $viewModel.alertItem) {alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
    
 
}

#Preview {
    AppitizersListView()
}
