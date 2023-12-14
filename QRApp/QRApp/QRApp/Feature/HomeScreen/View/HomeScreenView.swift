//
//  QrScannerView.swift
//  admin
//
//  Created by admin on 22.11.2023.
//


import SwiftUI
import CodeScanner


struct HomeScreenView: View{
    
    @StateObject var beaconDetector = BeaconDetector()

    static var staticScannedCode: String = ""
    @State private var errorMesage: String = ""
    @State private var isPresentingScanner = false
    @State private var didScanSuccessfully = false{
        didSet{
            beaconDetector.findBeacon()
        }
    }
    
    //MARK: - scanner sheet view
    var scannerSheet: some View {
        CodeScannerView(
            codeTypes: [.qr],
            showViewfinder: true,
            shouldVibrateOnSuccess: true
        ) { Result in
            if case let .success(code) = Result{
                HomeScreenView.staticScannedCode = code.string.uppercased()
                self.isPresentingScanner = false
                self.didScanSuccessfully = true
               
                
                print("HomeScreenView.staticScannedCode ="
                      ,HomeScreenView.staticScannedCode
                      ,HomeScreenView.staticScannedCode.count )
                print("didScanSuccessfully = " ,
                      didScanSuccessfully)
                print("qrScannerController.beaconDetector.isFetchDataFromScanner(data: HomeScreenView.staticScannedCode = ",
                      beaconDetector.isFetchDataFromScannerRight(data: HomeScreenView.staticScannedCode))
                      
            }
            if case let .failure(failure) = Result {
                errorMesage = failure.localizedDescription
                didScanSuccessfully = false
                print( "errorMesage = " ,errorMesage)
            }
        }
    }
    
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10){
                Text(beaconDetector.didFindBeacon ? "Succesful ✅": "Unsuccesful ❌")
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
    HomeScreenView()
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
