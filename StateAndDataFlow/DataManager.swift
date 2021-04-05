//
//  DataManager.swift
//  StateAndDataFlow
//
//  Created by Apple on 05.04.2021.
//

import SwiftUI

class DataManager {
    static let shared = DataManager()
    
    @AppStorage("user") private var userData: Data?
    
    private init() {}
    
    func saveUser(user: User) {
        userData = try? JSONEncoder().encode(user)
    }
    
    func loadUser() -> User {
        guard let user = try? JSONDecoder().decode(User.self, from: userData ?? Data()) else { return User() }
        return user
    }
    
    func clean(userManager: UserManager) {
        userManager.user.name = ""
        userManager.user.isRegister = false
        userData = nil
    }
    
}
