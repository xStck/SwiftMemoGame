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
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get{
            let faceUpCardIndices = cards.indices.filter{index in cards[index].isFaceUp}
            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
        }
        set{
            return cards.indices.forEach{
                cards[$0].isFaceUp = (newValue == $0)
            }
        }
    }
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}){
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched{
                if let potentialMatchedIndex = indexOfOneAndOnlyFaceUpCard{
                    if cards[chosenIndex].content == cards[potentialMatchedIndex].content{
                        cards[chosenIndex].isMatched=true
                        cards[potentialMatchedIndex].isMatched=true
                    }
                }else {
                    indexOfOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
        
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable{
        var id: String
        var isFaceUp: Bool = false
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
