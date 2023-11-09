//
//  MemoGameModel.swift
//  LabSwiftMemoGame
//
//  Created by Dawid Nalepa on 07/11/2023.
//

import Foundation

struct MemoGameModel<CardContent> where CardContent: Equatable{
    private(set) var cards:Array<Card>
    
    init(numberPairsOfCard: Int, cardContentFactory: (Int)-> CardContent){
        cards = []
        for pairIndex in 0..<max(2, numberPairsOfCard){
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id:"\(pairIndex+1)a", content: content))
            cards.append(Card(id:"\(pairIndex+1)b", content: content))
        }
    }
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}){
            cards[chosenIndex].isFaceUp.toggle()
        }
        
    }
    
    mutating func shuffle(){
       cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable{
        var id: String
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }
    
}


















//private func index(of card: Card) -> Int?{
//        for index in cards.indices{
//            if cards[index].id == card.id{
//                return index
//            }
//        }
//        return nil
//    }
