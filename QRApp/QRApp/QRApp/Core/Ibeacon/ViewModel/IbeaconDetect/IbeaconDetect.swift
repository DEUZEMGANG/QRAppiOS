//
//  IbeaconDetect.swift
//  QRApp
//
//  Created by admin on 28.11.2023.
//

import Foundation
import CoreLocation
import SwiftUI

class IBeaconDetector: NSObject, CLLocationManagerDelegate, ObservableObject {
    private var locationManager = CLLocationManager()
    
    //MARK: IBeacon Attribute
    @Published var lastDistance = CLProximity.unknown
    @Published var accuracy: CLLocationAccuracy = 0.0
    @Published var isStartBeacon: Bool = false
    
    override init() {
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
        let uuid = UUID(uuidString: "C9616ADC-E4F3-4DC5-892E-86174E0CB0E6")!
        let constraint = CLBeaconIdentityConstraint(uuid: uuid, major: 222, minor: 156)
        let beaconRange = CLBeaconRegion(beaconIdentityConstraint: constraint, identifier: "Some Identifier")
        
        locationManager.startMonitoring(for: beaconRange)
        locationManager.startRangingBeacons(satisfying: constraint)
    }
    
    func stopIBeacon() {
        let uuid = UUID(uuidString: "C9616ADC-E4F3-4DC5-892E-86174E0CB0E6")!
        let constraint = CLBeaconIdentityConstraint(uuid: uuid, major: 222, minor: 156)
        let beaconRange = CLBeaconRegion(beaconIdentityConstraint: constraint, identifier: "Some Identifier")
        
        locationManager.stopMonitoring(for: beaconRange)
        locationManager.stopRangingBeacons(satisfying: constraint)
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
       //if beacon is in range, get the ranging levels and accuracy
        if let beacon = beacons.first {
            self.lastDistance = beacon.proximity
            self.accuracy = beacon.accuracy
        }
        else {
            self.lastDistance = .unknown
            self.accuracy = 0.0
        }
    }
}
