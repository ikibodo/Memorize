//
//  Extensions.swift
//  Memorize
//
//  Created by N L on 29. 8. 2025..
//

import SwiftUI

extension Theme {
    var color: Color { Color(hex: colorHex) }
}

extension Color {
    init(hex: UInt32, alpha: Double = 1.0) {
        self.init(.sRGB,
                  red:   Double((hex >> 16) & 0xFF) / 255.0,
                  green: Double((hex >>  8) & 0xFF) / 255.0,
                  blue:  Double( hex        & 0xFF) / 255.0,
                  opacity: alpha)
    }
}
