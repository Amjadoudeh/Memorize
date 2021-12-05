//
//  Cardify.swift
//  Memorize
//
//  Created by Amjad Oudeh on 16.11.21.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    
    init (isFaceUp: Bool){
        rotation = isFaceUp ? 0 : 180
    }
    
    var rotation: Double // in degrees
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRaduis)
            if rotation > 90 {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                
            } else {
                shape.fill()
            }
            content.opacity(rotation > 90 ? 1 : 0)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0 , 1 , 0))
    }
    
    
    private struct DrawingConstants {
        static let cornerRaduis: CGFloat = 10
        static let lineWidth: CGFloat = 3
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
