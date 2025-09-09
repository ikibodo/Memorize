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
            themeList
                .navigationTitle("Themes")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar { toolbarContent }
                .resetAlert(isPresented: $showResetAlert) { themeStore.resetToDefaults() }
                .themeEditorSheet(editingThemeID: $editingThemeID, bindingProvider: themeStore.binding)
        }
        .tint(.primary)
    }
    
    private var themeList: some View {
        List {
            ForEach(themeStore.themes) { theme in
                row(for: theme)
                    .swipeEdit {
                        editingThemeID = theme.id }
                    .swipeDelete { themeStore.delete(theme) }
            }
            .onDelete(perform: themeStore.delete)
            .onMove(perform: themeStore.move)
        }
    }
    
    @ViewBuilder
    private func row(for theme: Theme) -> some View {
        NavigationLink { GameContainerView(theme: theme) } label: { ThemeRow(theme: theme) }
    }
    
    @ToolbarContentBuilder
    private var toolbarContent: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) { EditButton() }
        ToolbarItem(placement: .topBarTrailing) {
            MoreMenu(
                onNew: { themeStore.addNew() },
                onReset: { showResetAlert = true }
            )
        }
    }
}

private struct MoreMenu: View {
    let onNew: () -> Void
    let onReset: () -> Void
    
    var body: some View {
        Menu {
            Button(action: onNew)  {
                Label("New Theme", systemImage: "plus")
            }
            Button(role: .destructive, action: onReset) {
                Label("Reset to Defaults", systemImage: "arrow.clockwise")
            }
        } label: {
            Image(systemName: "ellipsis.circle")
        }
        .accessibilityLabel("More")
    }
}

private struct ThemeRow: View {
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

private struct GameContainerView: View {
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

private extension View {
    func swipeEdit(_ action: @escaping () -> Void) -> some View {
        swipeActions(edge: .leading, allowsFullSwipe: false) {
            Button(action: action) { Label("Edit", systemImage: "pencil") }.tint(.green)
        }
    }
    func swipeDelete(_ action: @escaping () -> Void) -> some View {
        swipeActions(edge: .trailing, allowsFullSwipe: true) {
            Button(role: .destructive, action: action) { Label("Delete", systemImage: "trash") }.tint(.red)
        }
    }
}

private extension View {
    func resetAlert(isPresented: Binding<Bool>, onConfirm: @escaping () -> Void) -> some View {
        alert("Reset all themes to defaults?", isPresented: isPresented) {
            Button("Cancel", role: .cancel) {}
            Button("Reset", role: .destructive, action: onConfirm)
        } message: {
            Text("This will replace your current themes with the default set.")
        }
    }

    func themeEditorSheet(
        editingThemeID: Binding<UUID?>,
        bindingProvider: @escaping (UUID) -> Binding<Theme>?
    ) -> some View {
        sheet(isPresented: Binding(
            get: { editingThemeID.wrappedValue != nil },
            set: { if !$0 { editingThemeID.wrappedValue = nil } }
        )) {
            if let id = editingThemeID.wrappedValue,
               let binding = bindingProvider(id) {
                ThemeEditor(theme: binding)
            } else {
                Text("Theme not found").padding()
            }
        }
    }
}

#Preview {
    NavigationStack {
        ThemeManagerView()
            .environmentObject(ThemeStore())
    }
}
