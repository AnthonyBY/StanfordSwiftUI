//
//  ContentView.swift
//  StanfordSwiftUI
//
//  Created by Anthony Marchenko on 10/13/21.
//

import SwiftUI

struct ContentView: View {
    var carEmoji = ["🚗", "🚕", "🚙", "🚌", "🚎", "🚑", "🏎", "🚓"]
    var heartEmoji = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼"]
    static let emojis = ["✈️", "⚠️", "☀️", "🐮", "💕", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14"]
    @State var emojiCount = 7
    @State var currentEmoji = emojis
    
    var body: some View {
        VStack {
            Text("Memorize!")
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], content: {
                    ForEach(currentEmoji[0...emojiCount], id: \.self, content: { emoji in
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
        Button {
            currentEmoji = carEmoji
        } label: {
                Image(systemName: "car")
                    .foregroundColor(Color.yellow)
                    .frame(width: 70, height: 70)
        }
    }
    
    var theme2: some View {
        Button {
            currentEmoji = heartEmoji
        } label: {
                Image(systemName: "heart")
                    .foregroundColor(Color.yellow)
                    .frame(width: 70, height: 70)
        }
    }
    
    var theme3: some View {
        Button {
            print("Image tapped!")
        } label: {
                Image(systemName: "person")
                    .foregroundColor(Color.yellow)
                    .frame(width: 70, height: 70)
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
                .preferredColorScheme(.dark)
        }
    }
}
