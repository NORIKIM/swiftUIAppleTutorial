//
//  EmojiImage.swift
//  Landmarks
//
//  Created by 김지나 on 2024/01/02.
//

import SwiftUI

struct EmojiImage: View {
    var body: some View {
        Image("emoji")
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct EmojiImage_Previews: PreviewProvider {
    static var previews: some View {
        EmojiImage()
    }
}
