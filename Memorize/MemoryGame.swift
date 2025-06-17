//
//  MemorizeGame.swift
//  Memorize
//
//  Created by N L on 16. 6. 2025..
//

import Foundation

struct MemoryGame <CardContent> { // Model
   private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int) {
        //        cards = Array<Card>()
        cards = []
        // add numberOfPairsOfCards x 2 cards
        for _ in 0..<numberOfPairsOfCards { // _ instead of pairIndex
            cards.append(Card(isFaceUp: false, isMatched: false, content: <#T##CardContent#>))
            cards.append(Card(isFaceUp: false, isMatched: false, content: <#T##CardContent#>))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        
    }
}
