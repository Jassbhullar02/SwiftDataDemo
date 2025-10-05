//
//  Book.swift
//  SwiftDataDemo
//
//  Created by Jaspreet Bhullar
//

import Foundation
import SwiftData

// MARK: - Book Model
// This model represents a single book entry in the SwiftData database.
// It stores details like title, author, genre, review, and rating.

@Model
class Book {
    // MARK: - Stored Properties
    
    /// The title of the book
    var title: String
    
    /// The author's name
    var author: String
    
    /// The selected genre for the book
    var genre: String
    
    /// User's written review about the book
    var review: String
    
    /// Rating given to the book (1–5)
    var rating: Int
    
    // MARK: - Initializer
    /// Initializes a new `Book` instance with all its details.
    init(title: String, author: String, genre: String, review: String, rating: Int) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
    }
}
