//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Amjad Oudeh on 06.10.21.


// the View
import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum:65))]){
                ForEach(game.cards){
                    card in CardView (card: card)
                        .aspectRatio(2/3, contentMode:.fit)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }
        }.foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            .padding(.horizontal)
    }
}

// cards
struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body : some View {
        let shape = RoundedRectangle(cornerRadius: 25.0)
        ZStack {
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
        
    }
}

