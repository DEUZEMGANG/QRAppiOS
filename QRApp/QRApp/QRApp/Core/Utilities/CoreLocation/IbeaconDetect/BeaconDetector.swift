//
//  IbeaconDetect.swift
//  QRApp
//
//  Created by admin on 28.11.2023.
//

import Foundation
import CoreLocation
import SwiftUI

/*
 Apple's intention is that you can't find all beacons around you, mostly for privacy reasons, but also to save power. Your app should only work with specific beacons, so you need to set up all your beacons so your app recognises them. You shouldn't be able to detect the beacons that my app uses. So the presence of a beacon will only be detected if the user explicitly downloads and runs an app that is supposed to detect that beacon.

 BTW. If you buy beacons, they should come with an application (usually a Mac or Windows application) that lets you change their ID. So if Joe's Carwash application uses beacons, Joe buys 100 beacons, and then sets them all up to he ID that Joe's Carwash app recognises. Otherwise Joe would be in real trouble if a beacon breaks, needs replacing, and then Joe needs to update his app. Instead if a beacon breaks that was set to ID xxxxx, Joe buys a new beacons, changes its ID to xxxxx, and puts it where the previous beacon was.
 */




class BeaconDetector: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    var scannedCode: String
    public var locationManager = CLLocationManager()
    
    //MARK: IBeacon Attribute
    @Published  var lastDistance = CLProximity.unknown
    @Published var accuracy: CLLocationAccuracy = 0.0
    @Published var isStartBeacon: Bool = false
    
    init(scannedCode: String) {
        self.scannedCode = QrScannerView.staticScannedCode
        
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) && CLLocationManager.isRangingAvailable() {
                isStartBeacon ? startIBeacon() : stopIBeacon()
            }
        }
    }
    
    
    func startIBeacon() {
        let uuid = UUID(uuidString: scannedCode)!
        let constraint = CLBeaconIdentityConstraint(uuid: uuid)
        let beaconRange = CLBeaconRegion(beaconIdentityConstraint: constraint, identifier: "DeuzemApp")
        
        locationManager.startMonitoring(for: beaconRange)
        locationManager.startRangingBeacons(satisfying: constraint)
        print("startIBeacon")
    }
    
    func stopIBeacon() {
        let uuid = UUID(uuidString: scannedCode)!
        let constraint = CLBeaconIdentityConstraint(uuid: uuid)
        let beaconRange = CLBeaconRegion(beaconIdentityConstraint: constraint, identifier: "DeuzemApp")
        
        locationManager.stopMonitoring(for: beaconRange)
        locationManager.stopRangingBeacons(satisfying: constraint)
        print("stopIBeacon")
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
       //if beacon is in range, get the ranging levels and accuracy

        DispatchQueue.main.async {
            if let beacon = beacons.first {
                print("accurancy 1 \(beacon.proximity)")
                self.lastDistance = beacon.proximity
                self.accuracy = beacon.accuracy
                print("beacon first ")
            }
            else {
                self.lastDistance = .unknown
                self.accuracy = 0.0
                print("beacon no first")
            }
            
            print("\n")
            print("Updated LastDistance \(self.lastDistance)")
            print("Updated Accuracy \(self.accuracy)")
        }
    }
    
    func didBeaconFind(beacons: [CLBeacon]) -> Bool{
           if !beacons.isEmpty {
               return true
           } else {
               return false
           }
       }
}