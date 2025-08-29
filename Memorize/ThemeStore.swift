//
//  ThemeStore.swift
//  Memorize
//
//  Created by N L on 29. 8. 2025..
//

import SwiftUI

final class ThemeStore: ObservableObject, Identifiable {
    @Published var themes: [Theme] = Theme.all
    let id = UUID()
}
