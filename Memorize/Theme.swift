//
//  Theme.swift
//  Memorize
//
//  Created by N L on 29. 8. 2025..
//

import Foundation

struct Theme: Identifiable, Codable, Hashable {
    var id = UUID()
    var name: String
    var emojis: [String]
    var numberOfPairsOfCards: Int
    var colorHex: UInt32

    static let all: [Theme] = [
        Theme(
            name: "Halloween",
            emojis: "👻🎃🕷️😈💀🕸🧙‍♀️🙀👹😱☠️🍭".emojiArray,
            numberOfPairsOfCards: 8,
            colorHex: 0xFFA500 // orange
        ),
        Theme(
            name: "Cats",
            emojis: "🐱😺😸😹😻😼🙀😿😾🐈🐈‍⬛🐾".emojiArray,
            numberOfPairsOfCards: 6,
            colorHex: 0x34C759 // green
        ),
        Theme(
            name: "Flowers",
            emojis: "🍀🍄🌺🌻🌹🥀🌷🌼🌸💐".emojiArray,
            numberOfPairsOfCards: 10,
            colorHex: 0xFFB6C1 // pink
        ),
        Theme(
            name: "Animals",
            emojis: "🐶🐱🐭🐹🐰🦊🐻🐼🐨🐯🦁🐮🐷🐸🐵".emojiArray,
            numberOfPairsOfCards: 6,
            colorHex: 0x008080 // teal
        ),
        Theme(
            name: "Faces",
            emojis: "😀😃😄😁😆😅😂🙂😉😊😇🥰😍🤩😘😗😙😚😋😛😝😜🤪🤔😐😑😶🙄😏😴".emojiArray,
            numberOfPairsOfCards: 8,
            colorHex: 0xFFCC00 // yellow
        ),
        Theme(
            name: "Vehicles",
            emojis: "🚗🚕🚙🚌🚎🏎🚓🚑🚒🚐🛻🚚🚛🚜✈️🚁🚂🚆🛵🏍🚲🛴🛺⛵️🛶🚤🛳".emojiArray,
            numberOfPairsOfCards: 8,
            colorHex: 0x8B4513 // brown
        ),
        Theme(
            name: "Food",
            emojis: "🍎🍏🍊🍋🍌🍉🍇🍓🍒🍑🥭🍍🥝🍅🍆🥕🌽🥔🥐🍞🧀🍔🍟🌭🍕🥪🌮🌯🥗🍣🍰🍩🍪🍫🍿".emojiArray,
            numberOfPairsOfCards: 10,
            colorHex: 0xFF3B30 // red
        ),
        Theme(
            name: "Weather",
            emojis: "☀️⛅️🌩🌨❄️⛄️💨🌪".emojiArray,
            numberOfPairsOfCards: 8,
            colorHex: 0x000080 // navy
        )
    ]
}

private extension String {
    var emojiArray: [String] { map { String($0) } }
}
