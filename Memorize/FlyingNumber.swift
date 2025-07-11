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
            Text(number, format: .number) // через форматировщик чисел FlyingNumber(number: 5) вместо Text("\(number)"
        }
    }
}

#Preview {
    FlyingNumber(number: 5)
}
