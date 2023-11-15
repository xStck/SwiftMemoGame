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
            Button("Shuffle"){
                viewModel.shuffle()
            }.foregroundColor(viewModel.themeColor)
            themeButtons
        }
        .padding()
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
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }.foregroundColor(viewModel.themeColor)
    }
    
}


#Preview {
    ContentView( viewModel: MyMemoGameViewModel())
}
