//
//  BooksViewController.swift
//  Assignment8
//
//  View Controller для отображения списка книг
//

import UIKit

class BooksViewController: UITableViewController {
    
    // MARK: - Properties
    var books: [Book] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadData()
        setupTableView()
    }
    
    // MARK: - Setup
    private func setupUI() {
        title = "Books"
        view.backgroundColor = .systemBackground
    }
    
    private func setupTableView() {
        tableView.rowHeight = 90
    }
    
    private func loadData() {
        books = [
            Book(title: "1984", author: "George Orwell", imageName: "book1",
                 description: "A dystopian social science fiction novel published in 1949. It tells the story of Winston Smith, a low-ranking member of 'the Party,' who is frustrated by the omnipresent eyes of Big Brother. The Party controls everything in Oceania, even the people's history and language. The novel explores themes of totalitarianism, surveillance, and the manipulation of truth.",
                 review: "A chilling masterpiece that remains terrifyingly relevant. Orwell's vision of a totalitarian future is both horrifying and thought-provoking. The concepts of doublethink and thoughtcrime are brilliant. Every page makes you appreciate freedom more. Essential reading for everyone. 10/10"),
            
            Book(title: "To Kill a Mockingbird", author: "Harper Lee", imageName: "book2",
                 description: "Published in 1960, this novel is set in the Deep South during the 1930s. Through the eyes of young Scout Finch, we witness her father Atticus defend a black man falsely accused of rape. The novel deals with serious issues of racial inequality and moral growth, while maintaining warmth and humor.",
                 review: "A beautiful and powerful novel about justice and morality. Atticus Finch is one of literature's greatest heroes. Harper Lee's writing is both accessible and profound. The courtroom scene is unforgettable. A timeless classic that everyone should read. 9.5/10"),
            
            Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald", imageName: "book3",
                 description: "Set in the Jazz Age on Long Island, this 1925 novel tells the story of the mysterious millionaire Jay Gatsby and his obsession with the beautiful Daisy Buchanan. Through narrator Nick Carraway, Fitzgerald explores themes of decadence, idealism, resistance to change, and the American Dream.",
                 review: "Fitzgerald's prose is absolutely gorgeous! The symbolism is rich and layered. Gatsby is a tragic figure that stays with you. A perfect critique of the American Dream and the emptiness of wealth. The ending is heartbreaking. Pure literary perfection. 9/10"),
            
            Book(title: "Harry Potter and the Sorcerer's Stone", author: "J.K. Rowling", imageName: "book4",
                 description: "The first novel in the Harry Potter series, published in 1997. Young Harry Potter discovers he's a wizard on his eleventh birthday and begins his education at Hogwarts School of Witchcraft and Wizardry. This book introduced the world to a magical universe that has captivated millions of readers worldwide.",
                 review: "Magical in every sense! J.K. Rowling created a world so vivid and enchanting. The characters are beloved for good reason. It rekindled my love for reading. Perfect for all ages. The beginning of an unforgettable journey. 9.5/10"),
            
            Book(title: "The Catcher in the Rye", author: "J.D. Salinger", imageName: "book5",
                 description: "Published in 1951, this novel follows teenager Holden Caulfield over a few days in New York City. After being expelled from prep school, Holden wanders through the city, criticizing the 'phoniness' of the adult world. The novel has become a classic of teenage rebellion and alienation.",
                 review: "Holden's voice is authentic and compelling. Salinger captures teenage angst perfectly. Some find him annoying, but I find him deeply human. The writing feels fresh even today. A controversial but important coming-of-age story. 8.5/10"),
            
            Book(title: "Pride and Prejudice", author: "Jane Austen", imageName: "book6",
                 description: "First published in 1813, this romantic novel follows Elizabeth Bennet as she deals with issues of manners, upbringing, morality, education, and marriage in the society of landed gentry. Her relationship with Mr. Darcy is one of literature's most famous romances, built on misunderstanding and eventual mutual respect.",
                 review: "Witty, romantic, and timeless! Elizabeth Bennet is a wonderful heroine. The social commentary is sharp and relevant. Austen's writing is elegant and humorous. The development of Elizabeth and Darcy's relationship is perfectly paced. A joy to read. 9/10"),
            
            Book(title: "The Lord of the Rings", author: "J.R.R. Tolkien", imageName: "book7",
                 description: "This epic high-fantasy trilogy, published between 1954-1955, follows hobbit Frodo Baggins as he journeys to destroy the One Ring. Tolkien created an entire world with its own languages, history, and mythology. The story explores themes of friendship, corruption, and the struggle between good and evil.",
                 review: "The greatest fantasy epic ever written! Tolkien's world-building is unparalleled. The journey is epic in every way. The characters are unforgettable. Rich with mythology and meaning. Changed the fantasy genre forever. A masterpiece of imagination. 10/10"),
            
            Book(title: "The Hobbit", author: "J.R.R. Tolkien", imageName: "book8",
                 description: "Published in 1937, this is the prequel to The Lord of the Rings. It follows Bilbo Baggins, a hobbit who is swept into an epic quest to reclaim the Dwarf Kingdom of Erebor from the dragon Smaug. More lighthearted than its sequel, it's an adventure story that appeals to readers of all ages.",
                 review: "A perfect adventure story! More accessible than Lord of the Rings but equally enchanting. Bilbo's transformation is wonderful to witness. The riddle game with Gollum is iconic. Smaug is a magnificent villain. Great for all ages. 9/10"),
            
            Book(title: "The Alchemist", author: "Paulo Coelho", imageName: "book9",
                 description: "Originally published in Portuguese in 1988, this philosophical novel follows Santiago, an Andalusian shepherd boy who dreams of finding treasure in Egypt. Through his journey, he learns about listening to his heart, recognizing opportunity, and following his dreams. The book has become an international bestseller.",
                 review: "Inspiring and deeply philosophical! Coelho's simple prose carries profound wisdom. The message about following your dreams resonates powerfully. Santiago's journey is both literal and metaphorical. A book that changes how you see life. Beautiful. 8.5/10"),
            
            Book(title: "Brave New World", author: "Aldous Huxley", imageName: "book10",
                 description: "Published in 1932, this dystopian novel is set in a futuristic World State where citizens are engineered through artificial wombs and childhood indoctrination. The society emphasizes technology, consumption, and instant gratification over emotion, family, and individual expression. A chilling vision of a 'perfect' society.",
                 review: "Disturbingly prophetic! Huxley's vision of a pleasure-driven dystopia is more relevant than ever. The critique of consumerism and technology is sharp. Different from 1984 but equally important. Makes you question modern society. A must-read. 9/10")
        ]
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBookDetail",
           let detailVC = segue.destination as? BookDetailViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            detailVC.book = books[indexPath.row]
        }
    }
}

// MARK: - UITableViewDataSource
extension BooksViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as? BookTableViewCell else {
            return UITableViewCell()
        }
        
        let book = books[indexPath.row]
        cell.configure(with: book)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension BooksViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showBookDetail", sender: nil)
    }
}
