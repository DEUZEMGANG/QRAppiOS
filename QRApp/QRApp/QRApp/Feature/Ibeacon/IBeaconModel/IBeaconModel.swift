//
//  IBeaconModel.swift
//  QRApp
//
//  Created by admin on 12.12.2023.
//

import Foundation

struct IBeaconModel: Identifiable, Equatable {
    var id = UUID()
    var uuid: UUID
    var name: String
    var major: Int
    var minor: Int
}
