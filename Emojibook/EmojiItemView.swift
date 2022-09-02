//
//  EmojiItemView.swift
//  Emojibook
//
//  Created by JOYNAL ABEDIN on 31/8/22.
//

import SwiftUI

struct EmojiItemView: View  {
    let emoji: String
    let emojiName: String
    
    var body: some View {
        Text("\(emoji) \(emojiName)")
            .font(.largeTitle)
            .padding([.top, .bottom])
    }
}
