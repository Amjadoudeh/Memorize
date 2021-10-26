//
//  MemoryGame.swift
//  Memorize
//
//  Created by Amjad Oudeh on 18.10.21.
//

import Foundation


struct MemoryGame<CardContent> {
    private (set) var cards: Array<Card>
    
    //here we have to make the cards able to flip over and playable
    func choose (_ card: Card){
        print("Hello")
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCards x 2 cards to cards Array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card( content: content, id: pairIndex*2))
            cards.append(Card( content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        
        var isFaceUp : Bool = true
        var isMatched : Bool = true
        var content : CardContent
        var id: Int
    }
}
