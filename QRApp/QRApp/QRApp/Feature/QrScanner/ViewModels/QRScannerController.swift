//
//  QRScanner.swift
//  QRApp
//
//  Created by admin on 23.11.2023.
//

class QRScannerController{
    
    let uuid: String
    let detector: BeaconDetector
    
    init(uuid: String) {
        self.uuid = uuid
        detector = BeaconDetector(scannedCode: uuid)
    }
    
    
    
    
    
    
    func findBeacon(){
        detector.isStartBeacon.toggle()
        
        //if isStartBeacon is false, reset the lastdistance and accuracy
        if detector.isStartBeacon == false {
            detector.lastDistance = .unknown
            detector.accuracy = 0.0
            
        }
        detector.locationManagerDidChangeAuthorization(detector.locationManager)
        
    }
    
    func  isFetchDataFromScanner(data: String) -> Bool{
    
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
}





//MARK: - NO Library to scan
/*
import Foundation
import SwiftUI
import Foundation
import AVFoundation


struct QRScanner: UIViewControllerRepresentable {
    @Binding var result: String
    
    class Coordinator: NSObject, AVCaptureMetadataOutputObjectsDelegate {
     
        @Binding var scanResult: String
     
        init(_ scanResult: Binding<String>) {
            self._scanResult = scanResult
        }
     
        func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
     
            // Check if the metadataObjects array is not nil and it contains at least one object.
            if metadataObjects.count == 0 {
                scanResult = "No QR code detected"
                return
            }
     
            // Get the metadata object.
            let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
     
            if metadataObj.type == AVMetadataObject.ObjectType.qr,
               let result = metadataObj.stringValue {
     
                scanResult = result
                print(scanResult)
     
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator($result)
    }
    
    func makeUIViewController(context: Context) -> QRScannerController {
        let controller = QRScannerController()
        controller.delegate = context.coordinator
     
        return controller
    }
    

    func updateUIViewController(_ uiViewController: QRScannerController, context: Context) {
    }
}



class QRScannerController: UIViewController {
    var captureSession = AVCaptureSession()
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView: UIView?

    var delegate: AVCaptureMetadataOutputObjectsDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Get the back-facing camera for capturing videos
        guard let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            print("Failed to get the camera device")
            return
        }

        let videoInput: AVCaptureDeviceInput

        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous device object.
            videoInput = try AVCaptureDeviceInput(device: captureDevice)

        } catch {
            // If any error occurs, simply print it out and don't continue any more.
            print(error)
            return
        }

        // Set the input device on the capture session.
        captureSession.addInput(videoInput)

        // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
        let captureMetadataOutput = AVCaptureMetadataOutput()
        captureSession.addOutput(captureMetadataOutput)

        // Set delegate and use the default dispatch queue to execute the call back
        captureMetadataOutput.setMetadataObjectsDelegate(delegate, queue: DispatchQueue.main)
        captureMetadataOutput.metadataObjectTypes = [ .qr ]

        // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoPreviewLayer?.frame = view.layer.bounds
        view.layer.addSublayer(videoPreviewLayer!)

        // Start video capture.
        DispatchQueue.global(qos: .background).async {
            self.captureSession.startRunning()
        }

    }

}

*/


