//
//  MemoGameViewModel.swift
//  LabSwiftMemoGame
//
//  Created by Dawid Nalepa on 08/11/2023.
//

import SwiftUI


class MyMemoGameViewModel: ObservableObject{
//    private static let emojis = ["🥸","😅","😤","😆","🧐","😶‍🌫️"]
    private static var emojis = ["🥸","😅","😤","😆","🧐","😶‍🌫️"]
    @Published private var model = createMemoGameModel()
    @Published var selectedTheme: String = "Motyw 1"

    
    private static func createMemoGameModel() -> MemoGameModel<String>{
        return MemoGameModel<String>(
            numberPairsOfCard: 10) {index in
                if emojis.indices.contains(index){
                    return emojis[index]
                }else{
                    return "??"
                }
            }
    }
    
    var cards: Array<MemoGameModel<String>.Card>{
        return model.cards
    }
    
    func shuffle(){
        model.shuffle()
    }
    
    func choose(_ card: MemoGameModel<String>.Card){
        model.choose(card)
    }
    
    func changeTheme() {
            switch selectedTheme {
            case "Motyw 2":
                MyMemoGameViewModel.emojis = ["🧛","🕷️", "💀", "🎃", "👻", "🦇", "🕸", "🍬"]
            case "Motyw 3":
                MyMemoGameViewModel.emojis = ["🐵", "🐷", "🐮", "🐼", "🐰", "🐱", "🐶", "🐯","🦅","🦉","🐥","🙈","🐈","🐀","🐿️","🦔"]
            default:
                MyMemoGameViewModel.emojis = ["🥸","😅","😤","😆","🧐","😶‍🌫️"]
            }
        model = MyMemoGameViewModel.createMemoGameModel()
    }
    
    var themeColor: Color {
            switch selectedTheme {
            case "Motyw 2": return .red
            case "Motyw 3": return .green
            default: return .blue
            }
        }
    
}
