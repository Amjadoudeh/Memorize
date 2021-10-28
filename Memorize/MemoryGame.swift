//
//  MemoryGame.swift
//  Memorize
//
//  Created by Amjad Oudeh on 18.10.21.
//

import Foundation
struct MemoryGame<CardContent> {
    // array of pairs of cards
    private (set) var cards: Array<Card>
    
    //here we have to make the cards able to flip over and playable
   mutating func choose (_ card: Card){
        // just testing ontap!
        let chosenIndex = Index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
        print("\(cards)")
    }
    
    func Index(of card: Card) -> Int {
            for index in 0..<cards.count {
                if cards[index].id == card.id {
                    return index
                }
            }
        return 0
    }
    
    // initializing the value of the array
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCards x 2 cards to cards Array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            // the same emojiCard but with unique Id
            cards.append(Card( content: content, id: pairIndex*2))
            cards.append(Card( content: content, id: pairIndex*2+1))
        }
    }
    
    // structure of the single card
    struct Card: Identifiable {
        
        var isFaceUp : Bool = true
        var isMatched : Bool = true
        var content : CardContent
        var id: Int
    }
}
