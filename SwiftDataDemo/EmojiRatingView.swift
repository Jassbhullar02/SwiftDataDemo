//
//  EmojiRatingView.swift
//  SwiftDataDemo
//
//  Created by Jaspreet Bhullar
//

import SwiftUI

// MARK: - EmojiRatingView
// A simple SwiftUI view that displays an emoji based on a book’s rating value.

struct EmojiRatingView: View {
    
    // MARK: - Properties
    /// The rating value for which an emoji will be shown (1–5).
    let rating: Int
    
    // MARK: - Body
    var body: some View {
        // Display a different emoji depending on the rating.
        switch rating {
        case 1:
            Text("☹️")   // Very bad
        case 2:
            Text("🥱")   // Boring
        case 3:
            Text("🫤")   // Okay
        case 4:
            Text("😊")   // Good
        default:
            Text("🤯")   // Excellent or amazing
        }
    }
}

// MARK: - Preview
#Preview {
    EmojiRatingView(rating: 3)
}
