//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by N L on 16. 6. 2025..
//

import SwiftUI

class EmojiMemoryGame { // ViewModel
    private static let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸", "🧙‍♀️", "🙀", "👹", "😱", "☠️", "🍭"] // static делает их видимыми как глобальную переменную (то есть это теперь EmojiMemoryGame.emojis)  и это дает возможность инициализации в var model. На самом деле это переменные типа или функции типа.
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 16) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    private var model = createMemoryGame() // EmojiMemoryGame.createMemoryGame
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) { // не должны иметь внешнего имени (оно нужно только если не определено что там с параметром или для читаемости кода)
        model.choose(card) // убрали внешнее имя и поэтому упростили от (card: card)
    }
}
