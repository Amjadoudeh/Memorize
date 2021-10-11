//  ContentView.swift
//  Memorize
//
//  Created by Amjad Oudeh on 06.10.21.

import SwiftUI

struct ContentView: View {
    var emojis = ["🚙","🏎","🚲","🛴","🚅","⛵️","🚑","🛳","🚞","🛵","🛫","🚁","🚘","🚜","🏍","🚃","🦽","🚓","🚒","🛩","💺","🛻","🚀","🛶","🛸"]
    @State var emojiCount = 4

    var body: some View {
        VStack{
            HStack{
                ForEach(emojis[0..<emojiCount], id: \.self) {
                    emoji in CardView (content: emoji)
                        }
                }
            Spacer()
            
            HStack{
                add
                Spacer()
                remove
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
    }

    var add : some View {
        Button(action:  {
            emojiCount -= 1
        }, label: {
            Image(systemName: "minus.circle")
        })
    }
    var remove : some View {
        Button(action:  {
            emojiCount += 1
        }, label: {
            Image(systemName: "plus.circle")
        })
    }
}


// cards
struct CardView: View {
    var content : String
   @State var isFaceUp : Bool = true
    
    var body : some View {
        let shape = RoundedRectangle(cornerRadius: 25.0)
        ZStack {
        if isFaceUp {
            shape.fill().foregroundColor(.white)
            shape.stroke(lineWidth: 3.0)
            Text(content).font(.largeTitle)
        } else {
            shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}





























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        ContentView()
            .preferredColorScheme(.light)
            
    }
}

