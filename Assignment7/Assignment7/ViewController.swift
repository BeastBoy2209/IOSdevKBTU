//
//  ViewController.swift
//  Assignment7
//
//  Created by Tim Kharitonov on 14.11.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    struct CategoryItem {
        let title: String
        let subtitle: String
        let image: UIImage
        let review: String
    }
    
    let categories = ["Favorite Movies", "Favorite Music", "Favorite Books", "University Courses"]
    
    // MARK: - Items for each category
    let movies: [CategoryItem] = [
        CategoryItem(title: "Astronaut", subtitle: "Sci-Fi Movie", image: UIImage(systemName: "film.fill")!, review: "Amazing visuals and a compelling story that keeps you on the edge of your seat."),
        CategoryItem(title: "The Martian", subtitle: "Sci-Fi Survival", image: UIImage(systemName: "film.fill")!, review: "Funny, smart, and inspiring. Shows how humor and science can save lives."),
        CategoryItem(title: "Interstellar", subtitle: "Space Drama", image: UIImage(systemName: "film.fill")!, review: "A masterpiece about space, time, and love. Hans Zimmer's soundtrack is unforgettable."),
        CategoryItem(title: "Inception", subtitle: "Mind-Bending Thriller", image: UIImage(systemName: "film.fill")!, review: "Very clever and intense. Makes you question reality itself."),
        CategoryItem(title: "The Lion King", subtitle: "Animation", image: UIImage(systemName: "film.fill")!, review: "Classic childhood favorite with timeless lessons about courage and family.")
    ]
    
    let music: [CategoryItem] = [
        CategoryItem(title: "Thunderstruck", subtitle: "AC/DC • Rock", image: UIImage(systemName: "music.note")!, review: "Legendary energy that never gets old. Perfect for getting pumped up."),
        CategoryItem(title: "Shape of You", subtitle: "Ed Sheeran • Pop", image: UIImage(systemName: "music.note")!, review: "Catchy and fun with a rhythm that sticks in your head for days."),
        CategoryItem(title: "Blinding Lights", subtitle: "The Weeknd • Synthwave", image: UIImage(systemName: "music.note")!, review: "Modern classic with an 80s vibe. Perfect driving song."),
        CategoryItem(title: "Uptown Funk", subtitle: "Bruno Mars • Funk", image: UIImage(systemName: "music.note")!, review: "Always lifts the mood. Impossible not to dance to this one."),
        CategoryItem(title: "All of Me", subtitle: "John Legend • Romance", image: UIImage(systemName: "music.note")!, review: "Soft and emotional. Beautiful piano melody and heartfelt lyrics.")
    ]
    
    let books: [CategoryItem] = [
        CategoryItem(title: "The Alchemist", subtitle: "Paulo Coelho • Novel", image: UIImage(systemName: "book.fill")!, review: "Meaningful and philosophical. Teaches you to follow your dreams and listen to your heart."),
        CategoryItem(title: "To Kill a Mockingbird", subtitle: "Harper Lee • Classic", image: UIImage(systemName: "book.fill")!, review: "Powerful and timeless story about justice, morality, and human dignity."),
        CategoryItem(title: "1984", subtitle: "George Orwell • Dystopia", image: UIImage(systemName: "book.fill")!, review: "Quite dark but brilliant. Eerily relevant to modern surveillance society."),
        CategoryItem(title: "The Great Gatsby", subtitle: "F. Scott Fitzgerald • Classic", image: UIImage(systemName: "book.fill")!, review: "Beautifully written portrait of the American Dream and its illusions."),
        CategoryItem(title: "Brave New World", subtitle: "Aldous Huxley • Sci-Fi", image: UIImage(systemName: "book.fill")!, review: "Thought-provoking vision of the future that makes you appreciate freedom.")
    ]
    
    let universityCourses: [CategoryItem] = [
        CategoryItem(title: "Intro to Computer Science", subtitle: "CS 101 • Programming", image: UIImage(systemName: "desktopcomputer")!, review: "Great starting point for programming. Opened my eyes to the digital world."),
        CategoryItem(title: "Intro to Physics", subtitle: "PHYS 101 • Science", image: UIImage(systemName: "atom")!, review: "Challenging but fun. Learning about the universe's fundamental laws is mind-blowing."),
        CategoryItem(title: "Intro to Chemistry", subtitle: "CHEM 101 • Science", image: UIImage(systemName: "flask.fill")!, review: "Interesting experiments and learning how everything around us is made of atoms."),
        CategoryItem(title: "Intro to Biology", subtitle: "BIO 101 • Life Sciences", image: UIImage(systemName: "leaf.fill")!, review: "Surprisingly cool to learn about life, cells, and evolution. Nature is amazing."),
        CategoryItem(title: "English Literature", subtitle: "ENG 101 • Language", image: UIImage(systemName: "text.book.closed.fill")!, review: "Useful and engaging. Improved my writing and critical thinking skills significantly.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
        
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 72, bottom: 0, right: 0)
    }
    
    func getItems(for section: Int) -> [CategoryItem] {
        switch section {
        case 0: return movies
        case 1: return music
        case 2: return books
        case 3: return universityCourses
        default: return []
        }
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        let items = getItems(for: indexPath.section)
        let item = items[indexPath.row]
        cell.configure(item: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section]
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let items = getItems(for: indexPath.section)
        let item = items[indexPath.row]
        
        print("Selected: \(item.title) from section \(indexPath.section)")
    }
    
    // BONUS: Custom header view
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        
        header.textLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        header.textLabel?.textColor = .label
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
}
