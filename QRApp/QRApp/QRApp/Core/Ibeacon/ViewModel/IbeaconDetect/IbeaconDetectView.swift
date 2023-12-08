//
//  IbeaconDetectView.swift
//  QRApp
//
//  Created by admin on 28.11.2023.
//
/*
import CoreLocation

var locationManager: CLLocationManager!







class BeaconManager: NSObject, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()

    override init() {
        super.init()

        locationManager.delegate = self

        // İzin isteği
        locationManager.requestWhenInUseAuthorization()

        // Tüm iBeacon'ları izleme başlatma
        startMonitoring()
    }

    func startMonitoring() {
        let beaconRegion = CLBeaconRegion(proximityUUID: UUID(), identifier: "com.yourcompany.yourapp")

        locationManager.startMonitoring(for: beaconRegion)
        startRanging(beaconRegion: beaconRegion)
    }

    func startRanging(beaconRegion: CLBeaconRegion) {
        locationManager.startRangingBeacons(in: beaconRegion)
    }

    // Delegate metodu: Beacon bulunduğunda çağrılır
    func locationManager(_ manager: CLLocationManager, didRange beacons: [CLBeacon], in region: CLBeaconRegion) {
        for beacon in beacons {
            let proximityUUID = beacon.uuid
            let major = beacon.major.uint16Value
            let minor = beacon.minor.uint16Value

            // Bulunan her iBeacon'ın bilgilerini ekrana yazdır
            print("Bulunan iBeacon Bilgileri:")
            print("UUID: \(proximityUUID)")
            print("Major: \(major)")
            print("Minor: \(minor)")
        }
    }
}
*/
