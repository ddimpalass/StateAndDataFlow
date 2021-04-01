//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Apple on 01.04.2021.
//

import Combine
import SwiftUI

class UserManager: ObservableObject {
    var objectWillChange = PassthroughSubject<UserManager, Never>()
    
    @AppStorage(wrappedValue: "", "name") var name
    @AppStorage(wrappedValue: false, "isRegister") var isRegister
    
    func save() {
        objectWillChange.send(self)
    }
}
