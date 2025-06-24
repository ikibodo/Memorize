//
//  AspectVGrig.swift
//  Memorize
//
//  Created by N L on 24. 6. 2025..
//

import SwiftUI

struct AspectVGrig<Item: Identifiable, ItemView: View>: View {
// struct AspectVGrig<Item>: View where Item: Identifiable { // другой вариант написания того что выше
    var items: [Item]
    var aspectRatio: CGFloat = 1
    var content: (Item) -> ItemView // функция(замыкание), которая принимает элементы и возвращает для него View
    
    var body: some View {
        GeometryReader { geometry in
            let gridItemSize = gridItemWithThatFits(
                count: items.count,
                size: geometry.size,
                atAspectRatio: aspectRatio
            )
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize), spacing: 0)], spacing: 0) {
                ForEach(items) { item in
                    content(item)
                        .aspectRatio(aspectRatio, contentMode: .fit)
                }
            }
        }
    }
    
    func gridItemWithThatFits(
        count: Int,
        size: CGSize,
        atAspectRatio aspectRatio: CGFloat
    ) -> CGFloat {
        let count = CGFloat(count)
        var columnCount = 1.0 // вместо Int
        repeat {
            let width = size.width / columnCount
            let height = width / aspectRatio
            
            let rowCount = (count / columnCount).rounded(.up)
            if rowCount * height < size.height {
                return (size.width / columnCount).rounded(.down)            }
            columnCount += 1
        } while columnCount < count
        return min(size.width / count, size.height * aspectRatio).rounded(.down)
    }
}

//#Preview {
//    AspectVGrig()
//}
