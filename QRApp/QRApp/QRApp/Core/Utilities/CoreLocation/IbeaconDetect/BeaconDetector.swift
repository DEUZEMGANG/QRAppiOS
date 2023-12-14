//
//  IbeaconDetect.swift
//  QRApp
//
//  Created by admin on 28.11.2023.
//


/*
 Apple's intention is that you can't find all beacons around you, mostly for privacy reasons, but also to save power. Your app should only work with specific beacons, so you need to set up all your beacons so your app recognises them. You shouldn't be able to detect the beacons that my app uses. So the presence of a beacon will only be detected if the user explicitly downloads and runs an app that is supposed to detect that beacon.

 BTW. If you buy beacons, they should come with an application (usually a Mac or Windows application) that lets you change their ID. So if Joe's Carwash application uses beacons, Joe buys 100 beacons, and then sets them all up to he ID that Joe's Carwash app recognises. Otherwise Joe would be in real trouble if a beacon breaks, needs replacing, and then Joe needs to update his app. Instead if a beacon breaks that was set to ID xxxxx, Joe buys a new beacons, changes its ID to xxxxx, and puts it where the previous beacon was.
 */



import Foundation
import CoreLocation
import SwiftUI

class BeaconDetector: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    
    public var locationManager = CLLocationManager()
    
    @Published var succesfulOrNotMesage: String = ""
    //MARK: IBeacon Attribute
    @Published var lastDistance = CLProximity.unknown
    @Published var accuracy: CLLocationAccuracy = 0.0
    @Published var didFindBeacon: Bool = false
    @Published var isStartBeacon: Bool = false
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    
    //MARK: - Beacon base funcs
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) && CLLocationManager.isRangingAvailable() {
                isStartBeacon ? startBeacon() : stopBeacon()
            }
        }
    }
    
    func startBeacon() {
        if(isFetchDataFromScannerRight(data: HomeScreenView.staticScannedCode)){
            let uuid = UUID(uuidString: HomeScreenView.staticScannedCode)!
            let constraint = CLBeaconIdentityConstraint(uuid: uuid)
            let beaconRange = CLBeaconRegion(beaconIdentityConstraint: constraint, identifier: "DeuzemApp")
            
            locationManager.startMonitoring(for: beaconRange)
            locationManager.startRangingBeacons(satisfying: constraint)
            print("startIBeacon")
        }else{
            print(print("startIBeacon couldn't start"))
        }
    }
    
    
    func stopBeacon() {
        if(isFetchDataFromScannerRight(data: HomeScreenView.staticScannedCode)){
            let uuid = UUID(uuidString: HomeScreenView.staticScannedCode)!
            let constraint = CLBeaconIdentityConstraint(uuid: uuid)
            let beaconRange = CLBeaconRegion(beaconIdentityConstraint: constraint, identifier: "DeuzemApp")
            
            locationManager.stopMonitoring(for: beaconRange)
            locationManager.stopRangingBeacons(satisfying: constraint)
            print("stopBeacon")
        }else{
            print(print("stopBeacon couldn't start"))
        }
        
    }
    
     
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
       //if beacon is in range, get the ranging levels and accuracy
        DispatchQueue.main.async { [self] in
            if let beacon = beacons.first {
                
                didFindBeacon = true
                print("isStartBeacon",didFindBeacon)
                lastDistance = beacon.proximity
                accuracy = beacon.accuracy
                // purpose is that when find beacon stop beacon finder
                isStartBeacon = false
                locationManagerDidChangeAuthorization(locationManager)
                
            }
            else {
                didFindBeacon = false
                lastDistance = .unknown
                accuracy = 0.0
            }
            
            print("\n")
            print("Updated LastDistance \(self.lastDistance)")
            print("Updated Accuracy \(self.accuracy)")
        }
    }
    
    //MARK: -  funcs
    
    // find beacon around device
    func findBeacon(){
        isStartBeacon = true
        
        //if isStartBeacon is false, reset the lastdistance and accuracy
        didFindBeacon = false
        lastDistance = .unknown
        accuracy = 0.0
        
        locationManagerDidChangeAuthorization(locationManager)
        
    }
     
    
    // check data from qrScanner, if taken data is in right form (UUID)
    func  isFetchDataFromScannerRight(data: String) -> Bool{
    
        if(data.count == 36){
            let strData = data.split(separator: "-")
            print(strData.count , "str data")
            if(strData.count == 5){
                return true
            }
            return false
        }
        return false
    }
    
    
    //MARK: - Getters and Setters
    

    
    func setDidFindBeacon(didFindBeacon: Bool){
        self.didFindBeacon = didFindBeacon
    }
    
    func getDidFindBeacon() -> Bool{
        return self.didFindBeacon
    }

}
