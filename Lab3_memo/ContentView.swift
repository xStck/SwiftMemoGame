//
//  ContentView.swift
//  Lab3_memo
//
//  Created by Dawid Nalepa on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🥸","🥸","😅","😅","😤","😤","😆","😆","🧐","🧐","😶‍🌫️","😶‍🌫️"].shuffled()
    
    
    @State var cardsCounter = 2
    @State var selectedTheme = "Motyw 1"
    var body: some View {
        VStack {
            title
            ScrollView{
                cardDisplay
            }
            //            cardsAdjusterView
            themeButtons
        }
        .padding()
    }
    
    var themeButtons: some View {
        HStack {
            ThemeButtonView(themeName: "Motyw 1", themeImage: "face.smiling", selectedTheme: $selectedTheme, emojis: $emojis)
            Spacer()
            ThemeButtonView(themeName: "Motyw 2", themeImage: "arrow.2.circlepath.circle", selectedTheme: $selectedTheme, emojis: $emojis)
            Spacer()
            ThemeButtonView(themeName: "Motyw 3", themeImage: "pawprint.circle", selectedTheme: $selectedTheme, emojis: $emojis)
        }
    }
    
    var title: some View {
        Text("Memo")
            .font(.largeTitle)
    }
    
    
    var cardDisplay : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 15){
            ForEach(0..<emojis.count, id: \.self){ index in
                CardView(content: emojis[index])
            }
        }.foregroundColor(selectedTheme == "Motyw 2" ? .red : selectedTheme == "Motyw 3" ? .green : .blue)
    }
    
    //    var cardAdd: some View {
    //        adjustCardNumber(by: 2, symbol: "+")
    //    }
    //
    //    var cardRemove : some View {
    //        adjustCardNumber(by: -2, symbol: "-")
    //    }
    
    //    var cardsAdjusterView : some View{
    //        HStack{
    //            cardRemove
    //            Spacer()
    //            cardAdd
    //        }
    //    }
    
    //    func adjustCardNumber(by offset: Int, symbol: String) -> some View{
    //        let newCounter = cardsCounter + offset
    //        if(symbol == "+"){
    //            return Button(action: {
    //                if newCounter >= 0 && newCounter <= emojis.count {
    //                   cardsCounter = newCounter
    //                }
    //            }){
    //                Image(systemName: "plus.app").font(.largeTitle)
    //            }.disabled(cardsCounter >= emojis.count)
    //        }
    //            return Button(action: {
    //                if newCounter >= 0 && newCounter <= emojis.count {
    //                   cardsCounter = newCounter
    //                }
    //            }){
    //                Image(systemName: "minus.square").font(.largeTitle)
    //            }.disabled(cardsCounter <= 0)
    //        }
}


#Preview {
    ContentView()
}
