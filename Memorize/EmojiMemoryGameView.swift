//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by N L on 17.9.24..
//

import SwiftUI

struct EmojiMemoryGameView: View {
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
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 2)) {
                        viewModel.choose(card)
                    }
                }
        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
