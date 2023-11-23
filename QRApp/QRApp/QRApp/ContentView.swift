//
//  ContentView.swift
//  QRApp
//
//  Created by merih on 23.11.2023.
//

import SwiftUI
import CodeScanner

struct ContentView: View {
    
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Scan a QR"
    
    var scannerSheet: some View {
        CodeScannerView(codeTypes: [.qr]) { Result in
            if case let .success(code) = Result{
                self.scannedCode = code.string
                self.isPresentingScanner = false
            }
        }
    }
    
    
    var body: some View {
        VStack(spacing: 10){
            Text(scannedCode)
            
            Button("Scan a QR Code"){
                self.isPresentingScanner = true
            }
            .sheet(isPresented: $isPresentingScanner){
                self.scannerSheet
            }
        }
    }
}

#Preview {
    ContentView()
}
