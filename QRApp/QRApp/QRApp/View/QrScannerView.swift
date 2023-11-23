//
//  QrScannerView.swift
//  admin
//
//  Created by admin on 22.11.2023.
//

import SwiftUI

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
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    QrScannerView()
}
