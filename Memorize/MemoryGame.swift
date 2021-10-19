//
//  MemoryGame.swift
//  Memorize
//
//  Created by Amjad Oudeh on 18.10.21.
//

import Foundation


struct MemoryGame {
    private (set) var cards: Array<Card>
    
    func choose (_ card: Card){
        
    }
    
    init(numberOfPairsOfCards: Int){
        cards = Array<Card>()
        // add numberOfPairsOfCards x 2 cards to cards Array
    }
    
    struct Card {
        var isFaceUp : Bool
        var isMatched : Bool
        var content : CardContent 
    }
}
