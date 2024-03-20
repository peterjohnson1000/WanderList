//
//  WanderListApp.swift
//  WanderList
//
//  Created by Peter Johnson on 3/16/24.
//

import SwiftUI

@main
struct WanderListApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
