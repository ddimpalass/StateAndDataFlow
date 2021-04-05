//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Apple on 01.04.2021.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $userManager.user.name)
                    .multilineTextAlignment(.center)
                Text("\(userManager.user.name.count)")
                    .foregroundColor(userManager.nameIsValid ? .green : .red)
            }
            .padding(.horizontal)
            Button(action: logIn) {
                Image(systemName: "checkmark.circle")
                Text("Ok")
            }
            .disabled(!userManager.nameIsValid)
        }
    }
    
    private func logIn() {
        if !userManager.user.name.isEmpty {
            userManager.user.isRegister.toggle()
            DataManager.shared.saveUser(user: userManager.user)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
