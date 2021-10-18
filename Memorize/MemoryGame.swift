//
//  MemoryGame.swift
//  Memorize
//
//  Created by Amjad Oudeh on 18.10.21.
//

import Foundation
import SwiftUI

struct MemoryGame {
    var cards: Array<Card>
    
    func choose (_ card: card){
        
    }
    struct Card {
        var isFaceUp : Bool
        var isMatched : Bool
        var content : CardContent
    }
}
