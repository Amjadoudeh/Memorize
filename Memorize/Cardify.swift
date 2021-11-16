//
//  Cardify.swift
//  Memorize
//
//  Created by Amjad Oudeh on 16.11.21.
//

import SwiftUI

struct Cardify: ViewModifier {
    
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRaduis)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                content
            } else {
                shape.fill()
            }
        }
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
