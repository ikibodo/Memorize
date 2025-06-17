//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by N L on 16. 6. 2025..
//

import SwiftUI

func createCardContent(forPairAtIndex index: Int) -> String {
    return ["👻", "🎃", "🕷️", "😈", "💀", "🕸", "🧙‍♀️", "🙀", "👹", "😱", "☠️", "🍭"][index]
}

class EmojiMemoryGame { // ViewModel
    private var model = MemoryGame<String>(
        numberOfPairsOfCards: 4,
        cardContentFactory: { (index: Int) -> String in
            return ["👻", "🎃", "🕷️", "😈", "💀", "🕸", "🧙‍♀️", "🙀", "👹", "😱", "☠️", "🍭"][index]
        }
    )
    
    var card: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) { // не должны иметь внешнего имени (оно нужно только если не определено что там с параметром или для читаемости кода)
        model.choose(card) // убрали внешнее имя и поэтому упростили от (card: card)
    }
}
