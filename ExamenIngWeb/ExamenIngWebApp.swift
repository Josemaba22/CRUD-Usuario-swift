//
//  ExamenIngWebApp.swift
//  ExamenIngWeb
//
//  Created by CCDM02 on 14/11/22.
//

import SwiftUI

@main
struct ExamenIngWebApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: CoreDataManager())
        }
    }
}
