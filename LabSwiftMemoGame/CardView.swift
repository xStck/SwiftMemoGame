//
//  CardView.swift
//  LabSwiftMemoGameApp
//
//  Created by Dawid Nalepa on 17/10/2023.
//

import SwiftUI

struct CardView: View {
    let card: MemoGameModel<String>.Card
    private var rotationAngle: Double = 0
    
    init(_ card: MemoGameModel<String>.Card){
        self.card = card
    }
    
    var body: some View {
        CirclePart(endAngle: .degrees(240))
            .opacity(0.4)
            .overlay(
                Text(card.content).font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(5)
                    .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                    .animation(card.isMatched ? .spin(duration: 2) : .default, value: card.isMatched)
                
            )
            .transformIntoCard(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

extension Animation {
    static func spin(duration: TimeInterval) -> Animation {
        .linear(duration: duration).repeatForever(autoreverses: false)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = MemoGameModel<String>.Card(id: "1", isFaceUp: true, isMatched: false, content: "😀")
        CardView(card)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
