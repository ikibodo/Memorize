//
//  ThemeEditor.swift
//  Memorize
//
//  Created by N L on 8. 9. 2025..
//

import SwiftUI

struct ThemeEditor: View {
    @Binding var theme: Theme
    
    @State private var emojisToAdd = ""
    @FocusState private var focused: Field?
    
    enum Field {
        case name
        case addEmojis
    }
    
    var body: some View {
        Form {
            Section("Theme") {
                TextField("Name", text: $theme.name)
                    .focused($focused, equals: .name)
            }
            Section("Color") {
                ColorPicker("Theme Color",
                            selection: Binding(
                                get: { Color(hex: theme.colorHex) },
                                set: { newColor in
                                    let ui = UIColor(newColor)
                                    var r: CGFloat=0, g: CGFloat=0, b: CGFloat=0, a: CGFloat=0
                                    ui.getRed(&r, green: &g, blue: &b, alpha: &a)
                                    theme.colorHex = (UInt32(r*255)<<16) | (UInt32(g*255)<<8) | UInt32(b*255)
                                }
                            ),
                            supportsOpacity: false
                )
            }
            Section("Pairs") {
                Stepper(value: $theme.numberOfPairsOfCards,
                        in: 2...max(theme.emojis.count, 2)) {
                    HStack {
                        Text("\(theme.numberOfPairsOfCards) pairs")
                        Spacer()
                        Button("All Emojis") { theme.numberOfPairsOfCards = theme.emojis.count }
                            .tint(.blue)
                    }
                }
            }
            Section("Emojis") {
                TextField("Add Emojis Here", text: $emojisToAdd)
                    .focused($focused, equals: .addEmojis)
                    .font(.system(size: 40))
                    .onChange(of: emojisToAdd) { _, new in
                        let newEmojis = new.filter { $0.isEmoji }.map { String($0) }
                        theme.emojis = (newEmojis + theme.emojis).uniqued()
                    }
                removeEmojisGrid
            }
        }
        .onAppear {
            DispatchQueue.main.async {
                focused = theme.name.isEmpty ? .name : .addEmojis
            }
        }
    }
    
    private var removeEmojisGrid: some View {
        VStack(alignment: .trailing) {
            Text("Tap to remove emojis (at least 2 required)")
                .font(.caption)
                .foregroundStyle(.secondary)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))]) {
                ForEach(theme.emojis, id: \.self) { e in
                    Text(e)
                        .font(.system(size: 40))
                        .opacity(theme.emojis.count <= 2 ? 0.4 : 1)
                        .onTapGesture {
                            guard theme.emojis.count > 2 else { return }
                            withAnimation {
                                theme.emojis.removeAll { $0 == e }
                                emojisToAdd.removeAll { String($0) == e }
                                theme.numberOfPairsOfCards = min(theme.numberOfPairsOfCards, theme.emojis.count)
                            }
                        }
                }
            }
        }
    }
}

struct ThemeEditorPreviewHost: View {
    @State private var t = Theme.all[0]
    var body: some View { ThemeEditor(theme: $t) }
}
#Preview { ThemeEditorPreviewHost() }

