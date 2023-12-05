//
//  MemoGameModel.swift
//  LabSwiftMemoGame
//
//  Created by Dawid Nalepa on 07/11/2023.
//

import Foundation

struct MemoGameModel<CardContent> where CardContent: Equatable{
    private(set) var cards:Array<Card>
    private(set) var score = 0
    
    init(numberPairsOfCard: Int, cardContentFactory: (Int)-> CardContent){
        cards = []
        for pairIndex in 0..<max(2, numberPairsOfCard){
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id:"\(pairIndex+1)a", content: content))
            cards.append(Card(id:"\(pairIndex+1)b", content: content))
        }
    }
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {cards.indices.filter{index in cards[index].isFaceUp}.oneAndOnly}
        set{cards.indices.forEach{cards[$0].isFaceUp = (newValue == $0)}}
    }
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}){
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched{
                if let potentialMatchedIndex = indexOfOneAndOnlyFaceUpCard{
                    if cards[chosenIndex].content == cards[potentialMatchedIndex].content{
                        cards[chosenIndex].isMatched=true
                        cards[potentialMatchedIndex].isMatched=true
                        score += 4
                    } else{
                        if cards[chosenIndex].hasBeenSeen{
                            score -= 1
                        }
                        if cards[potentialMatchedIndex].hasBeenSeen{
                            score -= 1
                        }
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
        var hasBeenSeen = false
        var isFaceUp: Bool = false {
            didSet {
                if oldValue && !isFaceUp {
                    hasBeenSeen = true
                }
            }
        }
        var isMatched: Bool = false
        var content: CardContent
    }
    
}

extension Array {
    var oneAndOnly: Element? {
        count == 1 ? first : nil
    }
}
