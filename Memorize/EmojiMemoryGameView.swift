//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Amjad Oudeh on 06.10.21.


// the View
import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3)
        { card in
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            } else {
                CardView (card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
        }
        
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
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 130-90))
                    .padding(6)
                    .opacity(0.5)
                Text(card.content)
                .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                .font(font(in: geometry.size))

            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width , size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let fontScale: CGFloat = 0.65
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
        
    }
}

