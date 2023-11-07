//
//  CardView.swift
//  LabSwiftMemoGameApp
//
//  Created by Dawid Nalepa on 17/10/2023.
//

import SwiftUI

struct CardView: View {
    let content: String
    @State var hidden: Bool = true
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle).aspectRatio(2/3, contentMode: .fit).frame(width: 40, height: 140)
            }.opacity(hidden ? 1 : 0)
            base.opacity(hidden ? 0: 1)
        }.onTapGesture (perform: {
            hidden.toggle()})
    }
}

#Preview {
    CardView(content: "😀")
}