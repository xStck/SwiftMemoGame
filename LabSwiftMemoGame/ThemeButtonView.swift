//
//  ThemeButtonView.swift
//  LabSwiftMemoGameApp
//
//  Created by Dawid Nalepa on 17/10/2023.
//

import SwiftUI

struct ThemeButtonView: View {
    let themeName: String
    let themeImage: String
    @Binding var selectedTheme: String
    @Binding var emojis: [String]
    var body: some View {
        Button(action: {
            selectedTheme = themeName
            
            switch selectedTheme {
            case "Motyw 2":
                emojis = [ "🧛","🕷️", "💀", "🎃", "👻", "🦇", "🕸", "🍬", "🧛","🕷️", "💀", "🎃", "👻", "🦇", "🕸", "🍬"].shuffled()
            case "Motyw 3":
                emojis = ["🐵", "🐷", "🐮", "🐼", "🐰", "🐱", "🐶", "🐯", "🐵", "🐷", "🐮", "🐼", "🐰", "🐱", "🐶", "🐯","🦅","🦉","🐥","🙈","🐈","🐀","🐿️","🦔","🦅","🦉","🐥","🙈","🐈","🐀","🐿️","🦔"].shuffled()
            default:
                emojis = ["🥸","🥸","😅","😅","😤","😤","😆","😆","🧐","🧐","😶‍🌫️","😶‍🌫️"].shuffled()
                
            }
            
        }) {
            VStack {
                Image(systemName: themeImage)
                    .font(.system(size: 24))
                Text(themeName)
                    .font(.caption)
            }
        }.foregroundColor(selectedTheme == "Motyw 2" ? .red : selectedTheme == "Motyw 3" ? .green : .blue)
    }
}

#Preview {
    ThemeButtonView(themeName: "Motyw 1", themeImage: "face.smiling", selectedTheme: .constant("Motyw 1"), emojis: .constant([]))
}

