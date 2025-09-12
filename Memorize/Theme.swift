//
//  Theme.swift
//  Memorize
//
//  Created by N L on 29. 8. 2025..
//

import Foundation

struct Theme: Identifiable, Codable, Hashable {
    let id: UUID
    var name: String
    var emojis: [String]
    var numberOfPairsOfCards: Int
    var colorHex: UInt32
    
    init(id: UUID = UUID(), name: String, emojis: [String], numberOfPairsOfCards: Int, colorHex: UInt32) {
        self.id = id
        self.name = name
        self.emojis = emojis
        self.numberOfPairsOfCards = numberOfPairsOfCards
        self.colorHex = colorHex
    }

    static let all: [Theme] = [
        Theme(
            id: UUID(uuidString: "f8f8e1c7-6db5-41ae-aaa0-000000000001") ?? UUID(),
            name: "Halloween",
            emojis: "👻🎃🕷️😈💀🕸🧙‍♀️🙀👹😱☠️🍭".emojiArray,
            numberOfPairsOfCards: 8,
            colorHex: 0xFFA500 // orange
        ),
        Theme(
            id: UUID(uuidString: "f8f8e1c7-6db5-41ae-aaa0-000000000002") ?? UUID(),
            name: "Cats",
            emojis: "🐱😺😸😹😻😼🙀😿😾🐈🐈‍⬛🐾".emojiArray,
            numberOfPairsOfCards: 6,
            colorHex: 0x34C759 // green
        ),
        Theme(
            id: UUID(uuidString: "f8f8e1c7-6db5-41ae-aaa0-000000000003") ?? UUID(),
            name: "Flowers",
            emojis: "🍀🍄🌺🌻🌹🥀🌷🌼🌸💐".emojiArray,
            numberOfPairsOfCards: 10,
            colorHex: 0xFFB6C1 // pink
        ),
        Theme(
            id: UUID(uuidString: "f8f8e1c7-6db5-41ae-aaa0-000000000004") ?? UUID(),
            name: "Animals",
            emojis: "🐶🐱🐭🐹🐰🦊🐻🐼🐨🐯🦁🐮🐷🐸🐵".emojiArray,
            numberOfPairsOfCards: 6,
            colorHex: 0x008080 // teal
        ),
        Theme(
            id: UUID(uuidString: "f8f8e1c7-6db5-41ae-aaa0-000000000005") ?? UUID(),
            name: "Faces",
            emojis: "😀😃😄😁😆😅😂🙂😉😊😇🥰😍🤩😘😗😙😚😋😛😝😜🤪🤔😐😑😶🙄😏😴".emojiArray,
            numberOfPairsOfCards: 8,
            colorHex: 0xFFCC00 // yellow
        ),
        Theme(
            id: UUID(uuidString: "f8f8e1c7-6db5-41ae-aaa0-000000000006") ?? UUID(),
            name: "Vehicles",
            emojis: "🚗🚕🚙🚌🚎🏎🚓🚑🚒🚐🛻🚚🚛🚜✈️🚁🚂🚆🛵🏍🚲🛴🛺⛵️🛶🚤🛳".emojiArray,
            numberOfPairsOfCards: 8,
            colorHex: 0x8B4513 // brown
        ),
        Theme(
            id: UUID(uuidString: "f8f8e1c7-6db5-41ae-aaa0-000000000007") ?? UUID(),
            name: "Food",
            emojis: "🍎🍏🍊🍋🍌🍉🍇🍓🍒🍑🥭🍍🥝🍅🍆🥕🌽🥔🥐🍞🧀🍔🍟🌭🍕🥪🌮🌯🥗🍣🍰🍩🍪🍫🍿".emojiArray,
            numberOfPairsOfCards: 10,
            colorHex: 0xFF3B30 // red
        ),
        Theme(
            id: UUID(uuidString: "f8f8e1c7-6db5-41ae-aaa0-000000000008") ?? UUID(),
            name: "Weather",
            emojis: "☀️⛅️🌩🌨❄️⛄️💨🌪".emojiArray,
            numberOfPairsOfCards: 8,
            colorHex: 0x000080 // navy
        )
    ]
}
