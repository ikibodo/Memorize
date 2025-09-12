//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by N L on 16. 6. 2025..
//

import SwiftUI

class EmojiMemoryGame: ObservableObject { // ViewModel
    typealias Card = MemoryGame<String>.Card
    
    let theme: Theme
    
    @Published private var game: MemoryGame<String>
    
    init(theme: Theme) {
        self.theme = theme
        self.game = EmojiMemoryGame.makeGame(with: theme)
    }
    
    private static func makeGame(with theme: Theme) -> MemoryGame<String> {
        let emojis = theme.emojis.shuffled()
        let pairCount = min(theme.numberOfPairsOfCards, emojis.count)
        return MemoryGame(numberOfPairsOfCards: pairCount) { index in
            emojis[index]
        }
    }
    
    var cards: [Card] {
        game.cards
    }
    var score: Int {
        game.score
    }
    var color: Color {
        theme.color
    }
    
    // MARK: - Intents
    func shuffle() {
        game.shuffle()
    }
    func choose(_ card: Card) {
        game.choose(card)
    }
    func newGame() {
        game = EmojiMemoryGame.makeGame(with: theme)
    }
}
