//
//  EmojiMemoryGame.swift
//  StanfordSwiftUI
//
//  Created by Anthony Marchenko on 10/20/21.
//

import SwiftUI

class EmojiMemoryGame {

    static let emoji = ["✈️", "⚠️", "☀️", "🩴", "💕", "⛑", "🧤", "🧦", "🧢"]

    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: 4, createCardContent: { index in
            return emoji[index]
        })
    }

    private var model: MemoryGame<String> = createMemoryGame()

    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
