//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Apple on 01.04.2021.
//

import Combine
import SwiftUI

class UserManager: ObservableObject {
    @Published var user = User()
    
    var nameIsValid: Bool {
        user.name.count > 2
    }
    
    init() {}
    
    init(user: User) {
        self.user = user
    }
}

struct User: Codable {
    var name = ""
    var isRegister = false
}
