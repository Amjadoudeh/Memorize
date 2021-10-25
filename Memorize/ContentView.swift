//  ContentView.swift
//  Memorize
//
//  Created by Amjad Oudeh on 06.10.21.

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame

    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum:65))])
            {
                ForEach(, id: \.self) {
                    emoji in CardView (content: emoji).aspectRatio(2/3, contentMode:.fit)
                        }
                }
            }.foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            Spacer()

        }
        .padding(.horizontal)
        
    }


}


// cards
struct CardView: View {
       var body : some View {
        let shape = RoundedRectangle(cornerRadius: 25.0)
        ZStack {
        if isFaceUp {
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: 3.0)
            Text(content).font(.largeTitle)
        } else {
            shape.fill()
            }
        }
        
    }
}





























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: EmojiMemoryGame)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        ContentView(viewModel: EmojiMemoryGame)
            .preferredColorScheme(.light)
            
    }
}

