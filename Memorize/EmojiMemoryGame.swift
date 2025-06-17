//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by N L on 16. 6. 2025..
//

import SwiftUI

class EmojiMemoryGame { // ViewModel
    private var model = MemoryGame(numberOfPairsOfCards: 4) { //  index = $0 и тогда $0 in не нужно
            return ["👻", "🎃", "🕷️", "😈", "💀", "🕸", "🧙‍♀️", "🙀", "👹", "😱", "☠️", "🍭"][$0]
        }
    
    var card: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) { // не должны иметь внешнего имени (оно нужно только если не определено что там с параметром или для читаемости кода)
        model.choose(card) // убрали внешнее имя и поэтому упростили от (card: card)
    }
}
