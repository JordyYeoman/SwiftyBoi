//
//  KeywordBubble.swift
//  Landmarks
//
//  Created by Jordy Yeoman on 28/11/2024.
//

import SwiftUI

struct KeywordBubbleDefaultPadding: View {
    let keyword: String
    let symbol: String
    let font: Font
    @ScaledMetric(relativeTo: .title) var paddingWidth = 14.5
    var body: some View {
        Label(keyword, systemImage: symbol)
            .font(font)
            .foregroundColor(.white)
            .padding(paddingWidth)
            .background(.purple.opacity(0.75), in: Capsule())
    }
}


struct KeywordBubbleDefaultPadding_Previews: PreviewProvider {
    static let keywords = ["chives", "fern-leaf lavender"]
    static var previews: some View {
        VStack {
            ForEach(keywords, id: \.self) { word in
                KeywordBubbleDefaultPadding(keyword: word, symbol: "leaf", font: .largeTitle)
            }
            
            ForEach(keywords, id: \.self) { j in
                KeywordBubbleDefaultPadding(keyword: j, symbol: "leaf", font: .caption2)
            }
        }
    }
}
