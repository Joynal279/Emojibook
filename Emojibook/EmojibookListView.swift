//
//  ContentView.swift
//  Emojibook
//
//  Created by JOYNAL ABEDIN on 31/8/22.
//

import SwiftUI

struct EmojibookListView: View {
    
    let emojiData: [EmojiDetails] = EmojiProvider.all()
    @State private var showingDetail: Bool = false
    @State private var visibleEmojiDetails: EmojiDetails?
    
    var body: some View {
        NavigationView {
            List{
                ForEach(emojiData) { emojiDetails in
                    Button {
                        visibleEmojiDetails = emojiDetails
                    } label: {
                        EmojiItemView(emoji: emojiDetails.emoji, emojiName: emojiDetails.name)
                    }

                }
            }
            .foregroundColor(.black)
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("EmojiBook")
        }
        .onOpenURL { url in
            guard let emojiDetails = emojiData.first(where: {$0.url == url}) else{return}
            visibleEmojiDetails = emojiDetails
        }
        .sheet(item: $visibleEmojiDetails, content: { emojiDetails in
            EmojiDetailsView(emojiDetails: emojiDetails)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojibookListView()
    }
}
