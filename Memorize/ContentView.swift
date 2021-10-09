//
//  ContentView.swift
//  Memorize
//
//  Created by Amjad Oudeh on 06.10.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
// Zstack is a bag where I can put my legoes in -> also it making the desigen stick togather :)
        HStack {
             ZStack {
// RoundedRecatngle is a shape and his label is conerRadius -> the value of this lable used to give the border radius for the rectangle
              RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
// stroke is a funcation used to give border
                .stroke(lineWidth: 3.0)
              Text("Welcome to Rome!!")
                   }
             ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                .stroke(lineWidth: 3.0)
              Text("Welcome to Rome!!")
                    }
            ZStack {
               RoundedRectangle(cornerRadius: 25.0)
               .stroke(lineWidth: 3.0)
             Text("Welcome to Rome!!")
                   }
            ZStack {
               RoundedRectangle(cornerRadius: 25.0)
               .stroke(lineWidth: 3.0)
             Text("Welcome to Rome!!")
                   }
        }
        .padding(.horizontal)
        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
    }
}


// cards































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

