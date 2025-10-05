//
//  RatingView.swift
//  SwiftDataDemo
//
//  Created by Jaspreet Bhullar
//

import SwiftUI

// MARK: - RatingView
// A reusable SwiftUI component that allows users to select a star rating.
// Commonly used for reviews or feedback screens.

struct RatingView: View {
    
    // MARK: - Properties
    /// A binding to the current rating value (1–5).
    @Binding var rating: Int
    
    /// Optional label to show before the rating (e.g., "Your Rating:").
    var label = ""
    
    /// Maximum number of stars to display.
    var maximumRating = 5
    
    /// The image to show when a star is not filled.
    var offImage: Image?
    
    /// The image to show when a star is filled.
    var onImage = Image(systemName: "star.fill")
    
    /// The color for unselected stars.
    var offColor = Color.gray
    
    /// The color for selected stars.
    var onColor = Color.yellow
    
    // MARK: - Body
    var body: some View {
        HStack {
            // Optional label text
            if label.isEmpty == false {
                Text(label)
            }
            
            // Loop through each star and create a tappable button
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Button {
                    // Update the rating when a star is tapped
                    rating = number
                } label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColor : onColor)
                }
            }
        }
        // Remove the default button styling for a clean star look
        .buttonStyle(.plain)
    }
    
    // MARK: - Helper Method
    /// Returns the appropriate star image (filled or unfilled) for the given number.
    func image(for number: Int) -> Image {
        if number > rating {
            offImage ?? onImage
        } else {
            onImage
        }
    }
}

// MARK: - Preview
#Preview {
    RatingView(rating: .constant(4))
}
