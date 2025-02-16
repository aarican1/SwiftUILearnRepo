//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Abdurrahman Arıcan on 27.11.2024.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode : String
    
    func makeCoordinator() -> Coordinator {
         Coordinator(scannerView : self)
        
       
        }
    
  
    func makeUIViewController(context:Context)-> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context){
        
    }
    
    final class Coordinator : NSObject, ScannerVCDelegate {
        
        private let scannerView : ScannerView
        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
        }
        
        init(scannerView : ScannerView){
            
            self.scannerView = scannerView
            
        }
        
        func didSurface(error: CameraError) {
            print(error.rawValue)
        }
        
        
    }

}

#Preview {
    ScannerView(scannedCode: .constant("123456"))
}
