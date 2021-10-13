//
//  ContentView.swift
//  StanfordSwiftUI
//
//  Created by Anthony Marchenko on 10/13/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["✈️", "⚠️", "☀️", "🐮"]

    var body: some View {
        HStack {
            ForEach(emojis, id: \.self, content: { emoji in
                CardView(content: emoji)
            })
        }
        .foregroundColor(.red)
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill()
                    .foregroundColor(.white)
                shape.stroke(lineWidth: 3).padding(.all, 0.0)
                Text(content)
            } else {
                shape.fill()
            }
        }
        .onTapGesture(perform: {
            isFaceUp = !isFaceUp
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
