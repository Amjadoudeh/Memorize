//
//  MemoryGame.swift
//  Memorize
//
//  Created by Amjad Oudeh on 18.10.21.
//

import Foundation


struct MemoryGame<CardContent> {
    private (set) var cards: Array<Card>
    
    func choose (_ card: Card){
        
    }
    
    init(numberOfPairsOfCards: Int){
        cards = Array<Card>()
        // add numberOfPairsOfCards x 2 cards to cards Array
        for pairIndex in 0..<numberOfPairsOfCards {
            cards.append(Card( content: <#T##CardContent#>))
            cards.append(Card( content: <#T##CardContent#>))
        }
    }
    
    struct Card {
        var isFaceUp : Bool = false
        var isMatched : Bool = false
        var content : CardContent 
    }
}
