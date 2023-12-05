//
//  ContentView.swift
//  LabSwiftMemoGameApp
//
//  Created by Dawid Nalepa on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MyMemoGameViewModel
    
    var body: some View {
        VStack {
            title
            ScrollView{
                cardDisplay.animation(.default, value: viewModel.cards)
            }
            HStack{
                score
                Spacer()
                shuffle
            }.font(.largeTitle)
            Spacer()
            themeButtons
        }
        .padding()
    }
    
    private var score: some View{
        Text("Score: \(viewModel.score)")
            .animation(nil)
    }
    
    private var shuffle: some View{
        Button("Shuffle"){
            withAnimation{
                viewModel.shuffle()
            }
        }.foregroundColor(viewModel.themeColor)
    }
    
    var themeButtons: some View {
        HStack {
            ThemeButtonView(themeName: "Motyw 1", themeImage: "face.smiling", viewModel: viewModel)
            Spacer()
            ThemeButtonView(themeName: "Motyw 2", themeImage: "arrow.2.circlepath.circle", viewModel: viewModel)
            Spacer()
            ThemeButtonView(themeName: "Motyw 3", themeImage: "pawprint.circle", viewModel: viewModel)
        }
    }
    
    var title: some View {
        Text("Memo")
            .font(.largeTitle)
    }
    
    
    var cardDisplay : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0){
            ForEach(viewModel.cards){ card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .overlay(FlyingNumber(number: scoreChange(cardId: card.id)))
                    .zIndex(scoreChange(cardId: card.id) != 0 ? 1 : 0)
                    .onTapGesture {
                        withAnimation{
                            let scorebeforeChoosing = viewModel.score
                            viewModel.choose(card)
                            let scoreChange = viewModel.score - scorebeforeChoosing
                            lastScoreChange = (scoreChange, card.id)
                        }
                    }
            }
        }.foregroundColor(viewModel.themeColor)
    }
    
    @State private var lastScoreChange = (0, "")
    
    private func scoreChange(cardId: MemoGameModel<String>.Card.ID) -> Int{
        let (amount, id) = lastScoreChange
        return cardId == id ? amount : 0
    }
    
}


#Preview {
    ContentView( viewModel: MyMemoGameViewModel())
}
