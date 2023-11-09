//
//  LabSwiftMemoGameApp.swift
//  LabSwiftMemoGameApp
//
//  Created by Dawid Nalepa on 17/10/2023.
//

import SwiftUI

@main
struct LabSwiftMemoGameApp: App {
    @StateObject var game = MyMemoGameViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
