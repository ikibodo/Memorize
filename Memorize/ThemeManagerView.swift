//
//  ThemeManagerView.swift
//  Memorize
//
//  Created by N L on 4. 9. 2025..
//

import SwiftUI

struct ThemeManagerView: View {
    @EnvironmentObject var themeStore: ThemeStore
    @Environment(\.editMode) private var editMode
    @State private var editingThemeID: UUID?
    @State private var showResetAlert = false
    
    var body: some View {
           NavigationStack {
               List {
                   ForEach(themeStore.themes) { theme in
                       NavigationLink {
                           GameContainerView(theme: theme)
                       } label: {
                           ThemeRow(theme: theme)
                       }
                       .swipeActions(edge: .leading, allowsFullSwipe: false) {
                           Button {
                               editingThemeID = theme.id
                           } label: {
                               Label("Edit", systemImage: "pencil")
                           }
                           .tint(.green)
                       }
                       .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                           Button(role: .destructive) {
                               themeStore.delete(theme)
                           } label: {
                               Label("Delete", systemImage: "trash")
                           }
                           .tint(.red)
                       }
                   }
                   .onDelete(perform: themeStore.delete)
                   .onMove(perform: themeStore.move)
               }
               .navigationTitle("Themes")
               .navigationBarTitleDisplayMode(.inline)
               .toolbar {
                   ToolbarItem(placement: .topBarLeading) {
                       EditButton()
                   }
                   ToolbarItem(placement: .topBarTrailing) {
                       Menu {
                           Button {
                               themeStore.addNew()
                           } label: {
                               Label("New Theme", systemImage: "plus")
                           }
                           Button(role: .destructive) {
                               showResetAlert = true
                           } label: {
                               Label("Reset to Defaults", systemImage: "arrow.clockwise")
                           }
                       } label: {
                           Image(systemName: "ellipsis.circle")
                       }
                       .accessibilityLabel("More")
                   }
               }
               .alert("Reset all themes to defaults?",
                      isPresented: $showResetAlert) {
                   Button("Cancel", role: .cancel) {}
                   Button("Reset", role: .destructive) {
                       themeStore.resetToDefaults()
                   }
               } message: {
                   Text("This will replace your current themes with the default set.")
               }
               .sheet(isPresented: Binding(
                   get: { editingThemeID != nil },
                   set: { if !$0 { editingThemeID = nil } }
               )) {
                   if let id = editingThemeID,
                      let binding = themeStore.binding(for: id) {
                       ThemeEditor(theme: binding)
                   } else {
                       Text("Theme not found").padding()
                   }
               }
           }
           .tint(.primary)
       }

       private func toggleEditMode() {
           withAnimation {
               if editMode?.wrappedValue.isEditing == true {
                   editMode?.wrappedValue = .inactive
               } else {
                   editMode?.wrappedValue = .active
               }
           }
       }
}

struct ThemeRow: View {
    let theme: Theme
    var subtitle: String {
        theme.numberOfPairsOfCards >= theme.emojis.count
        ? "All of"
        : "\(theme.numberOfPairsOfCards) pairs from"
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(theme.name)
                .font(.largeTitle)
                .foregroundStyle(theme.color)
            Text(subtitle + " " + theme.emojis.prefix(12).joined())
                .font(.callout)
                .foregroundStyle(.secondary)
                .lineLimit(1)
        }
    }
}

struct GameContainerView: View {
    let theme: Theme
    @StateObject private var vm: EmojiMemoryGame
    
    init(theme: Theme) {
        self.theme = theme
        _vm = StateObject(wrappedValue: EmojiMemoryGame(theme: theme))
    }
    
    var body: some View {
        EmojiMemoryGameView(viewModel: vm)
    }
}

#Preview {
    NavigationStack {
        ThemeManagerView()
            .environmentObject(ThemeStore())
    }
}
