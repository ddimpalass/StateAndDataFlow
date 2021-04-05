//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Apple on 01.04.2021.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    private let user = DataManager.shared.loadUser()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(UserManager(user: user))
        }
    }
}
