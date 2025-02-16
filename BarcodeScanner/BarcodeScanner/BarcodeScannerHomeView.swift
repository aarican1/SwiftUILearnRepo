//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Abdurrahman Arıcan on 25.10.2024.
//

import SwiftUI

struct AlertItem{
    let title : String
    let message : String
    let dismissButton : Alert.Button
}


struct BarcodeScannerHomeView: View {
    @State private var scannedCode : String = ""
    @State private var alertItem : AlertItem?
    
    var body: some View {
        NavigationView{
            VStack{
                ScannerView(scannedCode: $scannedCode)
                    .frame(maxWidth: .infinity, maxHeight: 400)
                Spacer()
                    .frame(height: 60)
                Label("Scanned Barcode : ", systemImage:"barcode.viewfinder")
                    .font(.title)
                Text(scannedCode.isEmpty ? "Not yet scanned" : scannedCode)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .padding()
                
                
            }
            .navigationTitle("Barcode Scanner")
           
        }
    }
}

#Preview {
    BarcodeScannerHomeView()
}
