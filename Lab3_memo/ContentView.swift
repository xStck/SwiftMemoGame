//
//  ContentView.swift
//  Lab3_memo
//
//  Created by Dawid Nalepa on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["😶‍🌫️","😤","😅","😆","🥹","🥸","🤓","🧐",
                  "😶‍🌫️","😤","😅","😆","🥹","🥸","🤓","🧐",
                  "😶‍🌫️","😤","😅","😆","🥹","🥸","🤓","🧐",
                  "😶‍🌫️","😤","😅","😆","🥹","🥸","🤓","🧐",
                  "😶‍🌫️","😤","😅","😆","🥹","🥸","🤓","🧐",
                  "😶‍🌫️","😤","😅","😆","🥹","🥸","🤓","🧐",
                  "😶‍🌫️","😤","😅","😆","🥹","🥸","🤓","🧐"]
    
    @State var cardsCounter = 2
    var body: some View {
        VStack {
            ScrollView{
                cardDisplay
            }
            cardsAdjusterView
        }
        .padding()
    }

    var cardDisplay : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<cardsCounter, id: \.self){ index in
                CardView(content: emojis[index])
            }
        }.foregroundColor(.blue)
    }

    var cardAdd: some View {
        adjustCardNumber(by: 2, symbol: "+")
    }

    var cardRemove : some View {
        adjustCardNumber(by: -2, symbol: "-")
    }

    var cardsAdjusterView : some View{
        HStack{
            cardRemove
            Spacer()
            cardAdd
        }
    }
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View{
        let newCounter = cardsCounter + offset
        if(symbol == "+"){
            return Button(action: {
                if newCounter >= 0 && newCounter <= emojis.count {
                   cardsCounter = newCounter
                }
            }){
                Image(systemName: "plus.app").font(.largeTitle)
            }.disabled(cardsCounter >= emojis.count)
        }
            return Button(action: {
                if newCounter >= 0 && newCounter <= emojis.count {
                   cardsCounter = newCounter
                }
            }){
                Image(systemName: "minus.square").font(.largeTitle)
            }.disabled(cardsCounter <= 0)
        }
    }


#Preview {
    ContentView()
}
