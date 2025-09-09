//
//  ThemeStore.swift
//  Memorize
//
//  Created by N L on 29. 8. 2025..
//

import SwiftUI

final class ThemeStore: ObservableObject, Identifiable {
    @Published var themes: [Theme] = [] {
        didSet { save() }
    }
    
    let id = UUID()
    private let key = "ThemeStore.themes"
    
    init() {
        load()
    }
    
    // MARK: CRUD
    @discardableResult
    func addNew() -> UUID {
        let t = Theme(
            name: "New Theme",
            emojis: ["👋","😃"],
            numberOfPairsOfCards: 2,
            colorHex: 0x007AFF
        )
        themes.insert(t, at: 0)
        return t.id
    }
    
    func delete(at offsets: IndexSet) {
        themes.remove(atOffsets: offsets)
    }
    
    func move(from: IndexSet, to: Int) {
        themes.move(fromOffsets: from, toOffset: to)
    }
    
    func delete(_ t: Theme) {
        themes.removeAll { $0.id == t.id }
    }
    

    func resetToDefaults() {
        themes = Theme.all
        save()
    }
    
    // MARK: Binding to element
    func binding(for id: UUID) -> Binding<Theme>? {
        guard let i = themes.firstIndex(where: { $0.id == id }) else { return nil }
        return Binding(
            get: {
                self.themes[i]
            },
            set: {
                self.themes[i] = $0
            }
        )
    }
    
    // MARK: Persistence
    private func save() {
        if let data = try? JSONEncoder().encode(themes) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
    private func load() {
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([Theme].self, from: data) {
            themes = decoded
        } else {
            themes = Theme.all
        }
    }
}
