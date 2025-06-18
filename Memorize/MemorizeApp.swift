//
//  MemorizeApp.swift
//  Memorize
//
//  Created by N L on 17.9.24..
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject private var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
