//
//  MemorizeGame.swift
//  Memorize
//
//  Created by N L on 16. 6. 2025..
//

import Foundation

struct MemoryGame <CardContent> where CardContent: Equatable { // Model
   private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        //        cards = Array<Card>()
        cards = []
        // add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable {
        static func == (lhs: Card, rhs: Card) -> Bool { // объяснение что делает  Equatable под капотом когда MemoryGame <CardContent> where CardContent: Equatable
            return lhs.isFaceUp == rhs.isFaceUp &&
            lhs.isMatched == rhs.isMatched &&
            lhs.content == rhs.content
        }
        
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
}
