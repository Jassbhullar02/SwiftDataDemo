//
//  ContentView.swift
//  SwiftDataDemo
//
//  Created by Jaspreet Bhullar on 04/10/25.
//

import SwiftUI
import SwiftData

// MARK: - ContentView
// Main view that lists all saved books from SwiftData and allows adding or deleting books.

struct ContentView: View {
    
    // MARK: - Environment & Query
    /// Access to SwiftData model context for saving or deleting data.
    @Environment(\.modelContext) var modelContext
    
    /// Fetches all books from SwiftData, sorted by title and author.
    @Query(sort: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    ]) var books: [Book]
    
    // MARK: - View State
    /// Controls the visibility of the AddBookView sheet.
    @State private var showingAddScreen = false
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List {
                // Loop through all books and show them in a list.
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            // Display emoji rating.
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            // Show book title and author.
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                // Enable swipe-to-delete functionality.
                .onDelete(perform: deleteBooks)
            }
            // MARK: - Navigation & Toolbar
            .navigationTitle("Bookworm")
            .navigationDestination(for: Book.self) { book in
                DetailView(book: book)
            }
            .toolbar {
                // Edit button for deleting multiple items.
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                // Add new book button.
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Book", systemImage: "plus") {
                        showingAddScreen.toggle()
                    }
                }
            }
            // Show AddBookView as a sheet.
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
        }
    }
    
    // MARK: - Delete Function
    /// Deletes selected books from SwiftData.
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            modelContext.delete(book)
        }
    }
}

#Preview {
    ContentView()
}
