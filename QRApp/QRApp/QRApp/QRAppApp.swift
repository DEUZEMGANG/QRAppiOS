//
//  QRAppApp.swift
//  QRApp
//
//  Created by merih on 23.11.2023.
//

import SwiftUI

@main
struct QRAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationView(content: {
                NavigationLink(destination: HomeScreenView()) {
                    
                    
                }
            })
            HomeScreenView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
