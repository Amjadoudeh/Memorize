//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Amjad Oudeh on 06.10.21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
