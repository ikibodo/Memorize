//
//  MemorizeGame.swift
//  Memorize
//
//  Created by N L on 16. 6. 2025..
//

import Foundation

struct MemoryGame <CardContent> { // Model
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        
    }
}
