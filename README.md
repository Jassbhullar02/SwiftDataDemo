📚 SwiftData Bookworm App

A simple and elegant SwiftUI + SwiftData demo project to manage your favorite books. You can add, view, rate, and delete books with a clean interface built using SwiftUI and Apple’s new SwiftData framework.

 🚀 Features
* 🧠 Uses SwiftData for local data storage
* ✨ Add / Edit / Delete books easily
* ⭐ Rate books using a custom RatingView
* 📖 View book details with review and genre
* 💾 Data automatically saved using @Model and @Query
* 📱 Fully built using SwiftUI NavigationStack and modern iOS patterns
  
 🧩 Tech Stack
* Language: Swift
* Frameworks: SwiftUI, SwiftData
* Architecture: MVVM-style simple structure
* Minimum iOS: iOS 17+
 🏗️ Project Structure

📁 SwiftDataBookworm
│
├── ContentView.swift          // Main screen showing book list
├── DetailView.swift           // Detailed book info and delete option
├── AddBookView.swift          // Form for adding a new book
├── EmojiRatingView.swift      // Shows emoji based on rating
├── RatingView.swift           // Custom rating star view
└── Book.swift                 // SwiftData model for book entity

 ⚙️ How It Works
1. Add a new book → Enter title, author, genre, review, and rating.
2. View list → Books automatically sorted by title and author.
3. Tap any book → See details and review.
4. Swipe to delete → Remove unwanted books easily.
   
 💡 Concepts Used
* @Model – For creating persistent data models
* @Query – To automatically fetch data
* @Environment(\.modelContext) – To access the SwiftData context
* NavigationStack – For modern navigation
* Sheet & Alert – For modals and confirmation dialogs

📸 Preview
The app UI is fully SwiftUI-based with clean layouts, emoji-based ratings, and smooth navigation transitions.

🧑‍💻 Created By
Jaspreet Singh iOS Developer | SwiftUI | Firebase | MVVM | SwiftData
