//
//  ContentView.swift
//  StanfordSwiftUI
//
//  Created by Anthony Marchenko on 10/13/21.
//

import SwiftUI

struct ContentView: View {
    var carEmoji = ["🚗", "🚕", "🚙", "🚌", "🚎", "🚑", "🏎", "🚓"]
    var animalEmoji = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐣", "🦉"]
    static let emoji = ["✈️", "⚠️", "☀️", "🩴", "💕", "⛑", "🧤", "🧦", "🧢"]

    @State var emojiCount = 7
    @State var currentEmoji = emoji
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.system(size: 36.0))
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], content: {
                    ForEach(currentEmoji[0..<emojiCount], id: \.self, content: { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    })
                })
                    .foregroundColor(.red)
            }
            HStack {
                theme1
                Spacer()
                theme2
                Spacer()
                theme3
            }
        }
        .padding(.horizontal)
    }
    
    var theme1: some View {
        VStack {
            Button {
                currentEmoji = carEmoji.shuffled()
                emojiCount = carEmoji.count
            } label: {
                Image(systemName: "car")
                    .foregroundColor(Color.yellow)
                    .frame(width: 50, height: 30)
            }
            Text("Vehicle")
                .font(.system(size: 12.0))
                .foregroundColor(.yellow)
        }
    }
    
    var theme2: some View {
        VStack {
            Button {
                currentEmoji = animalEmoji.shuffled()
                emojiCount = animalEmoji.count
            } label: {
                Image(systemName: "heart")
                    .foregroundColor(Color.yellow)
                    .frame(width: 50, height: 30)
            }
            Text("Heart")
                .font(.system(size: 12.0))
                .foregroundColor(.yellow)
        }
    }
    
    var theme3: some View {
        VStack {
            Button {
                currentEmoji = ContentView.emoji.shuffled()
                emojiCount = ContentView.emoji.count
            } label: {
                Image(systemName: "sun.max")
                    .foregroundColor(.yellow)
                    .frame(width: 50, height: 30)
            }
            Text("Emojis")
                .font(.system(size: 12.0))
                .foregroundColor(.yellow)
        }
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
                shape.strokeBorder(lineWidth: 4, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/).padding(.all, 1)
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
        }
    }
}
