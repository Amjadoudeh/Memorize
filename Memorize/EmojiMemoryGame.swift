//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Amjad Oudeh on 18.10.21.
//ViewModel

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    static let emojis = ["🚙","🏎","🚲","🛴","🚅","⛵️","🚑","🛳","🚞","🛵","🛫","🚁","🚘","🚜","🏍","🚃","🦽","🚓","🚒","🛩","💺","🛻","🚀","🛶","🛸","⛲️",]
    // you can change the number of pairs of cards here! :) 
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards :Array<Card> {
        model.cards
    }
    
    //MARK: - intent(s)
    
    func choose (_ card: Card){
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
}
