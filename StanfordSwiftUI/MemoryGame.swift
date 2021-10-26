//
//  MemoryGame.swift
//  StanfordSwiftUI
//
//  Created by Anthony Marchenko on 10/20/21.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(_card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
