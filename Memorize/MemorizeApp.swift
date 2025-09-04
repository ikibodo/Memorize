//
//  MemorizeApp.swift
//  Memorize
//
//  Created by N L on 17.9.24..
//

import SwiftUI

@main
struct MemorizeApp: App {
//    @StateObject private var game = EmojiMemoryGame()
    @StateObject private var themeStore = ThemeStore()
    
    var body: some Scene {
        WindowGroup {
//            EmojiMemoryGameView(viewModel: game)
            ThemeManagerView()
                .environmentObject(themeStore)
        }
    }
}
