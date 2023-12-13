//
//  QrScannerView.swift
//  admin
//
//  Created by admin on 22.11.2023.
//


import SwiftUI
import CodeScanner


struct QrScannerView: View {
    let qrScannerController = QRScannerController(uuid: "") // bakılacaaakk
    
    static var staticScannedCode: String = "Scan a QR"
    @State private var scannedCode: String = "Scan a QR"
    @State private var errorMesage: String = ""
    @State private var isPresentingScanner = false
    @State private var didScanSuccessfully = false
    
    
    var scannerSheet: some View {
        CodeScannerView(
            codeTypes: [.qr],
            showViewfinder: true,
            shouldVibrateOnSuccess: true
        ) { Result in
            if case let .success(code) = Result{
                QrScannerView.staticScannedCode = code.string
                scannedCode = code.string
                self.isPresentingScanner = false
                
                if(qrScannerController.isFetchDataFromScanner(data: QrScannerView.staticScannedCode)){
                    didScanSuccessfully = true
                    print(QrScannerView.staticScannedCode)
                }
                
                print(QrScannerView.staticScannedCode,QrScannerView.staticScannedCode.count )
                print(didScanSuccessfully)
                print(qrScannerController.isFetchDataFromScanner(data: QrScannerView.staticScannedCode), "rrr")
                      
            }
            if case let .failure(failure) = Result {
                errorMesage = failure.localizedDescription
            }
        }
    }
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10){
                Text(scannedCode)
                    .multilineTextAlignment(.leading)
                    .padding(.vertical, 80)
                    .padding(.horizontal)
                    .foregroundStyle(.blue)
                    .font(.title2)
                Spacer()
                
                
                
                Button(action: {
                    // Devamsızlık Aksiyonu
                    
                }, label: {
                    CustomButton(text: "Devamsızlık", textColor: .white, font: .title, fontWeight: .bold, buttonColor: .blue, roundedRectangleRadius: 15, padding: 60, frameMaxHeight: 70, frameMaxWidth: .infinity)
                    
                })
                .padding(.vertical, 30)
                
                
                
                
                Button(action: {
                    self.isPresentingScanner = true
                    
                }, label: {
                    CustomButton(text: "Qr Tara", textColor: .white, font: .title, fontWeight: .bold, buttonColor: .blue, roundedRectangleRadius: 15, padding: 60, frameMaxHeight: 70, frameMaxWidth: .infinity)
                    
                       
                })
                .padding(.bottom, 60)
                
                
                
                
                .sheet(isPresented: $isPresentingScanner){
                    self.scannerSheet
                    
                }
                
            }
        }
    }
}

#Preview {
    QrScannerView()
}



//MARK: - NO Library to scan

/*
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
