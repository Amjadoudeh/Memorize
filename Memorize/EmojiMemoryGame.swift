//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Amjad Oudeh on 18.10.21.
//

import SwiftUI

class EmojiMemoryGame {
    private var model : MemoryGame<String>
    
    var cards :Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
