//
//  Opacity_AppApp.swift
//  Opacity App
//
//  Created by Антон Пеньков on 04.04.2023.
//

import SwiftUI

@main
struct Opacity_AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
