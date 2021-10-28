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


class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🚙","🏎","🚲","🛴","🚅","⛵️","🚑","🛳","🚞","🛵","🛫","🚁","🚘","🚜","🏍","🚃","🦽","🚓","🚒","🛩","💺","🛻","🚀","🛶","🛸","⛲️",]

    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
                emojis[pairIndex]
        }
    }
    
    @Published private var model : MemoryGame<String> = createMemoryGame()
    
    var cards :Array<MemoryGame<String>.Card> {
         model.cards
    }
    
    //MARK: - intent(s)
    
    func choose (_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
