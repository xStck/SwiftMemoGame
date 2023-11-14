//
//  ThemeButtonView.swift
//  LabSwiftMemoGameApp
//
//  Created by Dawid Nalepa on 17/10/2023.
//

import SwiftUI

struct ThemeButtonView: View {
    let themeName: String
    let themeImage: String
    @ObservedObject var viewModel: MyMemoGameViewModel
    var body: some View {
        Button(action: {
            viewModel.selectedTheme = themeName
            viewModel.changeTheme()
            viewModel.shuffle()
        }) {
            VStack {
                Image(systemName: themeImage)
                    .font(.system(size: 24))
                Text(themeName)
                    .font(.caption)
            }
        }.foregroundColor(viewModel.themeColor)
    }
    
}

#Preview {
    ThemeButtonView(themeName: "Motyw 1", themeImage: "face.smiling", viewModel: MyMemoGameViewModel())
}

