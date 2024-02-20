//
//  sevenTestStudioApp.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 17.02.2024.
//

import SwiftUI

@main
struct sevenTestStudioApp: App {
    @StateObject var viewModel = AuthViewModel()
    var body: some Scene {
        WindowGroup {
		  ContentView()
			 .environmentObject(viewModel)
			 .environmentObject(LocationManager.shared)
        }
    }
}
