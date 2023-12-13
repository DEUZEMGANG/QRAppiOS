//
//  ContentView.swift
//  QRApp
//
//  Created by admin on 7.12.2023.
//
/*
import SwiftUI
import CoreLocation

struct BeaconView: View {
    @StateObject var detector = BeaconDetector()
   
    var body: some View {
        VStack {
            //MARK: Showing range levels
            switch detector.lastDistance {
            case .immediate:
                Text("Immediate")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            case .near:
                Text("Near")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            case .far:
                Text("Far")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            case .unknown:
                Text("Unknown")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            @unknown default:
                Text("Unknown")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }


            //MARK: Showing Accuracy in metres
            Text(String(format: "Accuracy: %0.2fm", detector.accuracy))
                .font(.largeTitle)
                .padding(.top, 40)
                
            

            //MARK: Start and Stop ranging
            Button(action: {
                //toggle the isStartBeacon
                detector.isStartBeacon.toggle()
                
                //if isStartBeacon is false, reset the lastdistance and accuracy
                if detector.isStartBeacon == false {
                    detector.lastDistance = .unknown
                    detector.accuracy = 0.0
                    
                }
                detector.locationManagerDidChangeAuthorization(detector.locationManager)
                
            }, label: {
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 75)
                    .frame(maxWidth: .infinity)
                    .padding(.all,60)
                    .foregroundStyle(.blue)
                    
                    .overlay(alignment: .center) {
                        Text(detector.isStartBeacon ? "Stop Ranging" : "Start Ranging")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                
                    
                    
            })
            .padding(.top, 80)
            
        }
        
    }
}


#Preview {
    BeaconView()
}
*/
