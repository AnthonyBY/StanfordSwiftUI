//
//  ContentView.swift
//  StanfordSwiftUI
//
//  Created by Anthony Marchenko on 10/13/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["✈️", "⚠️", "☀️", "🐮", "⚠️", "☀️", "🐮", "⚠️", "☀️", "🐮"]
    @State var emojiCount = 3
    
    var body: some View {
        VStack {
            HStack {
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], content: {
                    ForEach(emojis[0...emojiCount], id: \.self, content: { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    })
                })
            }
            HStack {
                remove
                Spacer()
                add
            }
            .foregroundColor(.yellow)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
    
    var remove: some View {
        Button(action: {
            emojiCount -= 1
        }, label: {
            VStack {
                Image(systemName: "minus.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.yellow)
                    .padding(.leading)
                    .frame(width: 50.0, height: 50.0)
            }
        })
    }
    
    var add: some View {
        Button(action: {
            emojiCount += 1
        }, label: {
            VStack {
                Image(systemName: "plus.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.yellow)
                    .padding(.leading)
                    .frame(width: 50.0, height: 50.0)
            }
            .frame(width: 100.0, height: 100.0)
        })
        
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
