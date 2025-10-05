//
//  AddBookView.swift
//  SwiftDataDemo
//
//  Created by Jaspreet Bhullar
//

import SwiftUI

// MARK: - AddBookView
// This view allows users to add a new book with details like title, author, genre, review, and rating.
struct AddBookView: View {
    
    // Access SwiftData context to insert new book records
    @Environment(\.modelContext) var modelContext
    
    // Used to dismiss the current sheet after saving
    @Environment(\.dismiss) var dismiss
    
    // State properties to store form inputs temporarily
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    // List of available genres for selection
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                // MARK: - Book Info Section
                Section {
                    // Book title input
                    TextField("Name of book", text: $title)
                    
                    // Author name input
                    TextField("Author's name", text: $author)
                    
                    // Genre picker
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                // MARK: - Review Section
                Section("Write a review") {
                    // Review text input
                    TextEditor(text: $review)
                    
                    // Custom rating view (1–5 stars)
                    RatingView(rating: $rating)
                }
                
                // MARK: - Save Button Section
                Section {
                    Button("Save") {
                        // Create a new Book object
                        let newBook = Book(
                            title: title,
                            author: author,
                            genre: genre,
                            review: review,
                            rating: rating
                        )
                        
                        // Insert new book into SwiftData
                        modelContext.insert(newBook)
                        
                        // Close the Add Book screen
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Book") // Navigation title for the view
        }
    }
}

// MARK: - Preview
#Preview {
    AddBookView()
}
