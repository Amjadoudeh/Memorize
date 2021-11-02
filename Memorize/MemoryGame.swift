//
//  MemoryGame.swift
//  Memorize
//
//  Created by Amjad Oudeh on 18.10.21.
//

import Foundation
struct MemoryGame<CardContent> where CardContent: Equatable {
    // array of pairs of cards
    private (set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose (_ card: Card){
        //if let chosenIndex = Index(of: card)
        
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        print("\(cards)")
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
        
        var isFaceUp : Bool = false
        var isMatched : Bool = false
        let content : CardContent
        let id: Int
    }
}
