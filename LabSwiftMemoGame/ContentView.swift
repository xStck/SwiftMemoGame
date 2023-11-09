//
//  ContentView.swift
//  LabSwiftMemoGameApp
//
//  Created by Dawid Nalepa on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MyMemoGameViewModel
    
    @State var selectedTheme = "Motyw 1"
    var body: some View {
        VStack {
            title
            ScrollView{
                cardDisplay.animation(.default, value: viewModel.cards)
            }
            Button("Shuffle"){
                viewModel.shuffle()
            }
//            themeButtons
        }
        .padding()
    }
    
//    var themeButtons: some View {
//        HStack {
//            ThemeButtonView(themeName: "Motyw 1", themeImage: "face.smiling", selectedTheme: $selectedTheme, emojis: $emojis)
//            Spacer()
//            ThemeButtonView(themeName: "Motyw 2", themeImage: "arrow.2.circlepath.circle", selectedTheme: $selectedTheme, emojis: $emojis)
//            Spacer()
//            ThemeButtonView(themeName: "Motyw 3", themeImage: "pawprint.circle", selectedTheme: $selectedTheme, emojis: $emojis)
//        }
//    }
    
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
        }.foregroundColor(selectedTheme == "Motyw 2" ? .red : selectedTheme == "Motyw 3" ? .green : .blue)
    }
    
}


#Preview {
    ContentView( viewModel: MyMemoGameViewModel())
}
