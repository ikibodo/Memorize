//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by N L on 17.9.24..
//

import SwiftUI

struct EmojiMemoryGameView: View {
    typealias Card = MemoryGame<String>.Card
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    
    var body: some View {
        VStack {
            cards
                .foregroundColor(viewModel.color)
            HStack {
                score
                Spacer()
                shuffle
            }
            .font(.largeTitle)
        }
        .padding()
    }
    
    private var score: some View {
        Text("Score: \(viewModel.score)")
            .animation(nil)
    }
    
    private var shuffle: some View {
        Button("Shuffle") {
            withAnimation {
                viewModel.shuffle()
            }
        }
    }
    
    private var cards: some View {
        AspectVGrig(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(spacing)
                .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                .zIndex(scoreChange(causedBy: card) != 0 ? 100 : 0)
                .onTapGesture {
                    choose(card)
                }
        }
    }
    
    private func choose(_ card: Card) {
        withAnimation {
            let scoreBeforeChoosing = viewModel.score
            viewModel.choose(card)
            let scoreChange = viewModel.score - scoreBeforeChoosing
            lastScoreChange = (scoreChange, causedByCardId: card.id) // = lastScoreChange = (scoreChange, card.id)
        }
    }
    
    
    @State private var lastScoreChange = (0, causedByCardId: "")  // кортеж ака Tuples
    
    private func scoreChange(causedBy card: Card) -> Int {
        let (amount, id) = lastScoreChange // = let (amount, causedByCardId: id) = lastScoreChange
        return card.id == id ? amount : 0
//        return lastScoreChange.1 == card.id ? lastScoreChange.0 : 0 //  lastScoreChange.1 и  lastScoreChange.0 соответствующие элементы кортежа второй и первый - такой синтаксис не рекомендован но возможен в ряде случаев 
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
