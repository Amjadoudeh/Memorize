//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Amjad Oudeh on 06.10.21.


// the View
import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        //        replacing the scrollView with a viewCombiner by adding a AspectVGrid
        
        //        ScrollView{
        //            LazyVGrid(columns: [GridItem(.adaptive(minimum:85))]){
        //                ForEach(game.cards)
        //                 { card in
        AspectVGrid(items: game.cards, aspectRatio: 2/3, content:
                        { card in
            CardView (card: card)
                .padding(4)
                .onTapGesture {
                    game.choose(card)
                }
        })
        //                        }
        //                }
        //            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            .padding(.horizontal)
    }
}

// cards
struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body : some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRaduis)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        }
    }
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width , size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRaduis: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.8
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

