//  ContentView.swift
//  Memorize
//
//  Created by Amjad Oudeh on 06.10.21.

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .padding(.horizontal)
        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
    }
}


// cards
struct CardView: View {
   @State var isFaceUp : Bool = true
    
    var body : some View {
        let shape = RoundedRectangle(cornerRadius: 25.0)
        ZStack {
        if isFaceUp {
            shape.fill().foregroundColor(.white)
            shape.stroke(lineWidth: 3.0)
            Text("✈️").font(.largeTitle)
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

