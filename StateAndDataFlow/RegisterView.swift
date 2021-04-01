//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Apple on 01.04.2021.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var user: UserManager
    @State private var name = ""
    @State private var charCount = 0
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                    .onChange(of: name) { newName in
                        charCount = name.count
                    }
                Text("\(charCount)")
                    .foregroundColor(charCount > 2 ? .green : .red)
            }
            .padding(.horizontal)
            Button(action: logIn) {
                Image(systemName: "checkmark.circle")
                Text("Ok")
            }
            .foregroundColor(charCount > 2 ? .blue : .gray)
        }
    }
    
    private func logIn() {
        if charCount > 2 {
            user.name = name
            user.isRegister.toggle()
            user.save()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
