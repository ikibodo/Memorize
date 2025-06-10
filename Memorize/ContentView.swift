//
//  ContentView.swift
//  Memorize
//
//  Created by N L on 17.9.24..
//

import SwiftUI

struct ContentView: View {
    @State private var message = "What will happen?"
    @State private var isToggled = false
    
    var body: some View { // вычисляемоей св-во, поведение
        
        VStack(alignment: .leading, spacing: 20) { // структура ведущая себя как представление  @ViewBuilder превращает список вьюх в TupleView
            Image(systemName: "star")
                .imageScale(.large)
                .foregroundColor(.orange)
            Text("Hi CS193p!")
                .font(.title)
        }
        
//            RoundedRectangle( cornerRadius: 12)
//                .strokeBorder(style: StrokeStyle(lineWidth: 10, dash: [10.2]))
//                .foregroundColor(.orange)
//                .imageScale(.small)
//                .padding()
        
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
        
        VStack {
            Text(message)
                .font(.title)
            
            Button (action: {
                isToggled.toggle()
                message = isToggled ? "Button tapped!" : "It's working!"
            }) {
                Text("Tap me")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack(content: {
            if isFaceUp {
                RoundedRectangle( cornerRadius: 12)
                    .foregroundColor(.white)
                
                RoundedRectangle( cornerRadius: 12)
                    .strokeBorder(lineWidth: 5)
                    .foregroundColor(.yellow)
                
                Rectangle()
                                .fill(Color.red)
                                .frame(width: 45, height: 45)
                                .padding()
                
                Circle()
                    .fill(Color.black)
                    .frame(width: 50, height: 50)
                
                Text("👻").font(.largeTitle)
            } else {
                RoundedRectangle( cornerRadius: 12)
//                    .foregroundColor(.orange)
            }
        })
    }
}

#Preview {
    ContentView()
}
