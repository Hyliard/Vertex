//
//  IsaiasApp.swift
//  Isaias
//
//  Created by Luis Martinez on 31/07/2025.
//

import SwiftUI

@main
struct IsaiasApp: App {
    @StateObject var session = SessionViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(session)
        }
    }
}
