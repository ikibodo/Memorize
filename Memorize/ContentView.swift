//
//  ContentView.swift
//  Memorize
//
//  Created by N L on 17.9.24..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: false)
            CardView()
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle( cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {
                base.fill()
            }
        }
    }
}

#Preview {
    ContentView()
}
