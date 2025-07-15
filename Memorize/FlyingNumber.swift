//
//  FlyingNumber.swift
//  Memorize
//
//  Created by N L on 11. 7. 2025..
//

import SwiftUI

struct FlyingNumber: View {
    let number: Int
    
    var body: some View {
        if number != 0 {
            Text(number, format: .number.sign(strategy: .always())) // через форматировщик чисел FlyingNumber(number: 5) вместо Text("\(number)"
                .font(.largeTitle)
                .foregroundColor(number < 0 ? .red : .green)
                .shadow(color: .black, radius: 1.5, x: 1, y: 1)
        }
    }
}

#Preview {
    FlyingNumber(number: 5)
}
