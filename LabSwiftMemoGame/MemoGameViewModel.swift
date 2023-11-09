//
//  MemoGameViewModel.swift
//  LabSwiftMemoGame
//
//  Created by Dawid Nalepa on 08/11/2023.
//

import SwiftUI


class MyMemoGameViewModel: ObservableObject{
    private static let emojis = ["🥸","😅","😤","😆","🧐","😶‍🌫️"]
    @Published private var model = createMemoGameModel()
    
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
}
