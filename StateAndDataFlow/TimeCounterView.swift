//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Apple on 01.04.2021.
//

import SwiftUI

struct TimeCounterView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.user.name)!")
                .font(.title)
                .offset(x: 0, y: 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            ButtonView(action: timer.startTimer, text: "\(timer.buttonTitle)", color: .red)
                .environmentObject(timer)
                .offset(x: 0, y: 300)
            Spacer()
            ButtonView(action: logOut, text: "LogOut", color: .blue)
                .padding()
        }
    }
    
    private func logOut() {
        DataManager.shared.clean(userManager: userManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TimeCounterView()
            .environmentObject(UserManager())
    }
}

struct ButtonView: View {
    let action: () -> Void
    let text: String
    let color: Color
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 200, height: 60)
        }
        .background(color)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
        
    }
}
