//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Amjad Oudeh on 06.10.21.


// the View
import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack{
            gameBody
            shuffle
        }
        .padding()
    }
    @State private var dealt = Set<Int>()
    
    private func deal(_ card: EmojiMemoryGame.Card){
        dealt.insert(card.id)
    }
    
    private func isUndealt(_ card:EmojiMemoryGame.Card) -> Bool {
        !dealt.contains(card.id)
    }
    
    var gameBody: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3)
        { card in
            if isUndealt(card) || (card.isMatched && !card.isFaceUp) {
                Rectangle().opacity(0)
            } else {
                CardView (card: card)
                    .padding(4)
                    .transition(AnyTransition.asymmetric(insertion: .scale, removal: .opacity).animation(.easeInOut(duration: 2)))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 2)){
                            game.choose(card)
                        }
                    }
            }
        }
        .onAppear{
            // deal the card out into my UI
            withAnimation{
                for card in game.cards {
                    deal(card)
                }
            }
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
        
    }
    
    var shuffle: some View {
        Button("Shuffle") {
            withAnimation(.easeInOut(duration: 1)) {
                game.shuffle()
            }
        }
    }
}

// cards
struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body : some View {
        GeometryReader { geometry in
            ZStack {
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 130-90))
                    .padding(5)
                    .opacity(0.5)
                Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
                    .font(Font.system(size: DrawingConstants.fontSize))
                    .scaleEffect(scale(thatFits: geometry.size))
                
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width , size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width , size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let fontScale: CGFloat = 0.65
        static let fontSize: CGFloat = 32
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

