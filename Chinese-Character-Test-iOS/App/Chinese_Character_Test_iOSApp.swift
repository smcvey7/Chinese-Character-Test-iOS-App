//
//  Chinese_Character_Test_iOSApp.swift
//  Chinese-Character-Test-iOS
//
//  Created by Steven McVey on 10/31/23.
//

import SwiftUI
import SwiftData

@main
struct Chinese_Character_Test_iOSApp: App {
//    @StateObject var userViewModel = UserViewModel()

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
//            ContentView()
            LoginView()
//            .environmentObject(userViewModel)
        }
        .modelContainer(sharedModelContainer)
    }
}
