//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Amjad Oudeh on 18.10.21.
//

import SwiftUI

//func makeCardContent(index : Int) -> String {
//    return "🤪"
//}


class EmojiMemoryGame {
    
    
    static let emojis = ["🚙","🏎","🚲","🛴","🚅","⛵️","🚑","🛳","🚞","🛵","🛫","🚁","🚘","🚜","🏍","🚃","🦽","🚓","🚒","🛩","💺","🛻","🚀","🛶","🛸","⛲️",]

    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
                emojis[pairIndex]
        }
    }
    
    private var model : MemoryGame<String> = createMemoryGame()
    
    
    
    
    var cards :Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
