//
//  some_radiosApp.swift
//  some-radios
//
//  Created by Taipa Xu on 2023/10/4.
//

import SwiftUI

@main
struct some_radiosApp: App {
    @StateObject var radioPlayState = RadioPlayState();

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(radioPlayState)
        }
    }
}
