//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Amjad Oudeh on 06.10.21.
//

import SwiftUI
// the main App 
@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
