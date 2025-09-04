//
//  ThemeManagerView.swift
//  Memorize
//
//  Created by N L on 4. 9. 2025..
//

import SwiftUI

struct ThemeManagerView: View {
    @EnvironmentObject var themeStore: ThemeStore
    
    var body: some View {
        NavigationStack {
            List(themeStore.themes) { theme in
                NavigationLink {
                    //                        GameContainerView(theme: theme)
                } label: {
                    ThemeRow(theme: theme)
                }
            }
            .navigationTitle("Themes")
        }
    }
}

struct ThemeRow: View {
    let theme: Theme
    var subtitle: String {
        theme.numberOfPairsOfCards >= theme.emojis.count
        ? "All of"
        : "\(theme.numberOfPairsOfCards) pairs from"
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(theme.name)
                .font(.largeTitle)
                .foregroundStyle(theme.color)
            Text(subtitle + " " + theme.emojis.prefix(12).joined())
                .font(.callout)
                .foregroundStyle(.secondary)
                .lineLimit(1)
        }
    }
}

struct GameContainerView: View {
    let theme: Theme
    private let vm: EmojiMemoryGame
    //    init(theme: Theme) {
    //        self.theme = theme;
    //        self.vm = EmojiMemoryGame(theme: theme)
    //    }
    var body: some View {
        EmojiMemoryGameView(viewModel: vm)
    }
}

#Preview {
    ThemeManagerView()
        .environmentObject(ThemeStore())
}
