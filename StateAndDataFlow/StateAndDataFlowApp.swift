//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Apple on 01.04.2021.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    @StateObject private var user = UserManager()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(user)
        }
    }
}
