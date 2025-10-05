//
//  DetailView.swift
//  SwiftDataDemo
//
//  Created by Jaspreet Bhullar
//

import SwiftUI
import SwiftData

// MARK: - DetailView
// Displays detailed information about a selected book, including its cover image, author, review, and rating.

struct DetailView: View {
    
    // MARK: - Environment
    /// Provides access to the SwiftData context for deleting the book.
    @Environment(\.modelContext) var modelContext
    
    /// Used to dismiss the current view after deleting a book.
    @Environment(\.dismiss) var dismiss
    
    // MARK: - View State
    /// Controls the visibility of the delete confirmation alert.
    @State private var showingDeleteAlert = false
    
    // MARK: - Book Data
    /// The selected book whose details are displayed.
    let book: Book
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            // MARK: - Book Image & Genre
            ZStack(alignment: .bottomTrailing) {
                // Display genre image as book cover.
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                
                // Genre label overlay.
                Text(book.genre.uppercased())
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
            
            // MARK: - Author & Review
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)
            
            Text(book.review)
                .padding()
            
            // Display static rating as emoji stars.
            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        
        // MARK: - Delete Confirmation Alert
        .alert("Delete book", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure?")
        }
        
        // MARK: - Toolbar
        .toolbar {
            Button("Delete this book", systemImage: "trash") {
                showingDeleteAlert = true
            }
        }
    }
    
    // MARK: - Delete Book Function
    /// Deletes the current book from SwiftData and dismisses the view.
    func deleteBook() {
        modelContext.delete(book)
        dismiss()
    }
}

#Preview {
    do {
        // MARK: - Preview Setup
        // Creates an in-memory SwiftData container for preview purposes.
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        
        // Example book for SwiftUI preview.
        let example = Book(
            title: "Test Book",
            author: "Test Author",
            genre: "Fantasy",
            review: "This was a great book; I really enjoyed it.",
            rating: 4
        )
        
        return DetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}

