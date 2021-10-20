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
    
    private var model : MemoryGame<String> =
    MemoryGame<String>(numberOfPairsOfCards: 4, createCardContent: { (index : Int) -> String in
        return "🤪"
    })
    
    
    
    var cards :Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
