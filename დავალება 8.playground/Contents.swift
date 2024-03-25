import Foundation

//1. შევქმნათ Class Book.
//- Properties: bookID(უნიკალური იდენტიფიკატორი Int), String title, String author, Bool isBorrowed.
//- Designated Init.
//- Method რომელიც ნიშნავს წიგნს როგორც borrowed-ს.
//- Method რომელიც ნიშნავს წიგნს როგორც დაბრუნებულს.

class Book {
    var bookID: Int
    var title: String
    var author: String
    var isBorrowed: Bool
    
    
    init(bookID: Int, title: String, author: String, isBorrowed: Bool) {
        self.bookID = bookID
        self.title = title
        self.author = author
        self.isBorrowed = isBorrowed
    }
    
    func borrowedBook() {
        if isBorrowed == true {
            print("This book is borrowed")
        } else {
            print("This book isn't borrowed")
        }
    }
    func returnedBook() {
        if isBorrowed == false {
            print("This book is returned")
        } else {
            print("This book isn't returned")
        }
    }
}

let myBookInfo = Book(bookID: 3, title: "Emma", author: "Jane Austin", isBorrowed: true)

myBookInfo.borrowedBook()

myBookInfo.returnedBook()


//2.შევქმნათ Class Owner
// - Properties: ownerId(უნიკალური იდენტიფიკატორი Int), String name, Books Array სახელით borrowedBooks.
// - Designated Init.
// - Method რომელიც აძლევს უფლებას რომ აიღოს წიგნი ბიბლიოთეკიდან.
// -Method რომელიც აძლევს უფლებას რომ დააბრუნოს წაღებული წიგნი.

class Owner {
    var ownerId: Int
    var name: String?
    var borrowedBooks: [Book]
    var libraryBooks: [Library]
    
    init(ownerId: Int, name: String) {
        self.ownerId = ownerId
        self.name = name
        self.borrowedBooks = []
        self.libraryBooks = []
    }
    
    func borrowBook(_ book: Book) {
        if !book.isBorrowed {
            borrowedBooks.append(book)
            book.isBorrowed = true
            print("\(String(describing: name)) has borrowed the book '\(String(describing: book.title))'")
        } else {
            print("Sorry, the book '\(String(describing: book.title))' is already borrowed.")
        }
    }
    
    func returnBook(_ book: Book) {
        if let index = borrowedBooks.firstIndex(where: { $0.bookID == book.bookID }) {
            borrowedBooks.remove(at: index)
            book.isBorrowed = false
            print("\(String(describing: name)) has returned the book '\(String(describing: book.title))'")
        } else {
            print("You do not have the book '\(String(describing: book.title))' to return.")
        }
    }
}


let me = Owner(ownerId: 5, name: "Mariam")

let myBook = Book(bookID: 8, title: "Jane Eyre", author: "Charlotte Bronte", isBorrowed: true)


me.borrowBook(myBook)

me.returnBook(myBook)



//3. შევქმნათ Class Library
// - Properties: Books Array, Owners Array.
// - Designated Init.
// - Method წიგნის დამატება, რათა ჩვენი ბიბლიოთეკა შევავსოთ წიგნებით.
// - Method რომელიც ბიბლიოთეკაში ამატებს Owner-ს.
// - Method რომელიც პოულობს და აბრუნებს ყველა ხელმისაწვდომ წიგნს.
// - Method რომელიც პოულობს და აბრუნებს ყველა წაღებულ წიგნს.
// - Method რომელიც ეძებს Owner-ს თავისი აიდით თუ ეგეთი არსებობს.
// - Method რომელიც ეძებს წაღებულ წიგნებს კონკრეტული Owner-ის მიერ.
// - Method რომელიც აძლევს უფლებას Owner-ს წააღებინოს წიგნი თუ ის თავისუფალია.

class Library {
    var books: [Book]
    var owners: [Owner]
    
    init(books: [Book], owners: [Owner]) {
        self.books = books
        self.owners = owners
    }
    
    func bookAdd(_ book: Book) {
        books.append(book)
    }
    
    func ownerAdd(_ owner: Owner) {
        owners.append(owner)
    }
    
    func availableBooks(book: Book) -> [Book] {
        if book.isBorrowed == false {
            print("წიგნი ხელმისაწვდომია")
        }
        return books
        
        
        
        //აქედან გავიჭედე საკმაოდ :( ეს 2 რო არ გამოვიდა, მე4-შიც ვერ ჩავსვი ზოგი ინფო
        
        /*func booksTakenBy(ownerID: Int) -> [Book] {
         var takenBooks: [Book] = []
         for book in books {
         if let borrower = book.borrower, borrower.id == ownerID {
         takenBooks.append(book)
         }
         }
         return takenBooks
         }
         */
        
        func findOwnerByID(owner: Owner) {
            var ownerId = owner.ownerId
            for ownerID in owners {
                if ownerId == 01 {
                }
                print("yes")
            }
            
            
            
            
            func takeBook(bookTitle: String, by ownerID: Int) -> String {
                var owner: Owner?
                for o in owners {
                    if o.ownerId == ownerID {
                        owner = o
                        break
                    }
                }
                
                
            }
            
        }
        
        
        
        //4. გავაკეთოთ ბიბლიოთეკის სიმულაცია.
        // - შევქმნათ რამოდენიმე წიგნი და რამოდენიმე Owner-ი, შევქმნათ ბიბლიოთეკა.
        // - დავამატოთ წიგნები და Owner-ები ბიბლიოთეკაში
        // - ავაღებინოთ Owner-ებს წიგნები და დავაბრუნებინოთ რაღაც ნაწილი.
        // - დავბეჭდოთ ინფორმაცია ბიბლიოთეკიდან წაღებულ წიგნებზე, ხელმისაწვდომ წიგნებზე და გამოვიტანოთ წაღებული წიგნები კონკრეტულად ერთი Owner-ის მიერ.
        
        
        var book1 = Book(bookID: 1, title: "wigni1", author: "avtori1", isBorrowed: true)
        var book2 = Book(bookID: 2, title: "wigni2", author: "avtori2", isBorrowed: false)
        var book3 = Book(bookID: 3, title: "wigni3", author: "avtori3", isBorrowed: false)
        var book4 = Book(bookID: 4, title: "wigni4", author: "avtori4", isBorrowed: true)
        
        var owner1 = Owner(ownerId: 1, name: "gvanca")
        var owner2 = Owner(ownerId: 2, name: "mariami")
        
        var lib = Library(books: [book1, book2, book3, book4], owners: [owner1, owner2])
        
        owner1.borrowedBooks = [book1]
        //owner1.returnBook(book: book2)
        
    }
}
