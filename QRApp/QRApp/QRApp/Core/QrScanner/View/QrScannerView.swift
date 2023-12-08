//
//  QrScannerView.swift
//  admin
//
//  Created by admin on 22.11.2023.
//


import SwiftUI
import CodeScanner


struct QrScannerView: View {
    
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Scan a QR"
    
    var scannerSheet: some View {
        CodeScannerView(
            codeTypes: [.qr],
            showViewfinder: true,
            shouldVibrateOnSuccess: true
        ) { Result in
            if case let .success(code) = Result{
                self.scannedCode = code.string
                self.isPresentingScanner = false
            }
        }
    }
    
    
    var body: some View {
        VStack(spacing: 10){
            Text(scannedCode)
                .multilineTextAlignment(.leading)
                .padding(.vertical, 80)
                .padding(.horizontal)
                .foregroundStyle(.blue)
                .font(.title2)
            Spacer()
            Button(action: {
                self.isPresentingScanner = true
            }, label: {
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 75)
                    .frame(maxWidth: .infinity)
                    .padding(.all,60)
                    .foregroundStyle(.blue)
                    
                    .overlay(alignment: .center) {
                        Text("Scan a QR Code")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                
                    
                    
            })
            
            
            .sheet(isPresented: $isPresentingScanner){
                self.scannerSheet
            }
        }
    }
}

#Preview {
    QrScannerView()
}


/*
//MARK: - NO Library to scan


struct QrScannerView: View {
    @State var scanResult = "No QR code detected"
 
    var body: some View {
        ZStack(alignment: .bottom) {
            QRScanner(result: $scanResult)
 
            Text(scanResult)
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .padding(.bottom)
                
        }
    }
}

#Preview {
    QrScannerView()
}
*/
