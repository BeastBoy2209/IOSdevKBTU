//
//  CourseTableViewCell.swift
//  Assignment8
//
//  Custom cell для отображения курса в таблице
//

import UIKit

class MoviesViewController: UITableViewController {
    
    // MARK: - Properties
    var movies: [Movie] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadData()
        setupTableView()
    }
    
    // MARK: - Setup
    private func setupUI() {
        title = "Movies"
        view.backgroundColor = .systemBackground
    }
    
    private func setupTableView() {
        tableView.rowHeight = 90
    }
    
    private func loadData() {
        movies = [
            Movie(title: "The Shawshank Redemption", imageName: "movie1", 
                  description: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency. Andy Dufresne is wrongly convicted of murdering his wife and her lover, and is sentenced to life in Shawshank State Penitentiary. Over the years, he befriends Ellis 'Red' Redding and helps the warden with his money laundering scheme.",
                  review: "An absolute masterpiece! This film showcases the power of hope and friendship. Tim Robbins and Morgan Freeman deliver career-defining performances. The storytelling is flawless, and the ending is one of the most satisfying in cinema history. A must-watch for everyone. 10/10"),
            
            Movie(title: "The Godfather", imageName: "movie2",
                  description: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son. Vito Corleone is the head of a New York Mafia family, and when he refuses to partner with a heroin dealer, an assassination attempt forces him to hand over power to his youngest son, Michael.",
                  review: "A cinematic triumph that defined the gangster genre. Marlon Brando's performance is legendary, and the direction by Francis Ford Coppola is impeccable. Every scene is crafted with precision, creating an epic tale of power, family, and loyalty. Simply iconic. 10/10"),
            
            Movie(title: "The Dark Knight", imageName: "movie3",
                  description: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice. Heath Ledger's portrayal of the Joker is unforgettable, bringing a level of menace and unpredictability never seen before.",
                  review: "Heath Ledger's Joker is one of the greatest villain performances ever. Christopher Nolan elevated the superhero genre to new heights. The action sequences are spectacular, and the moral dilemmas add depth. A dark, thrilling masterpiece. 9.5/10"),
            
            Movie(title: "Pulp Fiction", imageName: "movie4",
                  description: "The lives of two mob hitmen, a boxer, a gangster and his wife intertwine in four tales of violence and redemption. Quentin Tarantino's masterpiece features an ensemble cast and non-linear storytelling that revolutionized modern cinema.",
                  review: "Tarantino at his finest! The dialogue is razor-sharp, the soundtrack is perfect, and the storytelling structure is brilliant. John Travolta and Samuel L. Jackson have incredible chemistry. Endlessly quotable and rewatchable. 9/10"),
            
            Movie(title: "Forrest Gump", imageName: "movie5",
                  description: "The presidencies of Kennedy and Johnson, the Vietnam War, and other historical events unfold from the perspective of an Alabama man with an IQ of 75. Tom Hanks delivers a heartwarming performance as Forrest, a simple man who inadvertently influences several defining moments in American history.",
                  review: "A beautiful, emotional journey through American history. Tom Hanks is absolutely brilliant, making us laugh and cry. The film perfectly balances humor and drama. 'Life is like a box of chocolates' - a timeless classic that never gets old. 9/10"),
            
            Movie(title: "Inception", imageName: "movie6",
                  description: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O. Christopher Nolan crafts a mind-bending heist thriller that operates on multiple levels of reality.",
                  review: "Mind-blowing and visually stunning! Nolan created something truly original. The concept is complex but executed brilliantly. The rotating hallway scene is cinema gold. That ending still has me thinking. A masterclass in filmmaking. 9.5/10"),
            
            Movie(title: "The Matrix", imageName: "movie7",
                  description: "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers. The Wachowskis created a groundbreaking sci-fi action film that questions the nature of reality itself.",
                  review: "Revolutionary! The action choreography, bullet-time effects, and philosophical themes changed cinema forever. Keanu Reeves is perfect as Neo. The 'red pill or blue pill' scene is iconic. A genre-defining masterpiece. 9/10"),
            
            Movie(title: "Interstellar", imageName: "movie8",
                  description: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival. Matthew McConaughey leads a mission beyond our solar system to find a new home for mankind as Earth becomes uninhabitable.",
                  review: "Scientifically fascinating and emotionally powerful. Hans Zimmer's score is hauntingly beautiful. The visuals of space are breathtaking. The time dilation concept is brilliantly executed. Nolan combines hard sci-fi with human emotion perfectly. 9/10"),
            
            Movie(title: "Fight Club", imageName: "movie9",
                  description: "An insomniac office worker and a devil-may-care soap maker form an underground fight club that evolves into much more. David Fincher's adaptation of Chuck Palahniuk's novel is a critique of consumer culture and masculinity.",
                  review: "Dark, subversive, and unforgettable. Edward Norton and Brad Pitt are phenomenal. The twist ending changes everything on rewatch. A bold commentary on modern society wrapped in a thrilling package. Fincher's direction is flawless. 9/10"),
            
            Movie(title: "Goodfellas", imageName: "movie10",
                  description: "The story of Henry Hill and his life in the mob, covering his relationship with his wife Karen Hill and his mob partners Jimmy Conway and Tommy DeVito. Scorsese's masterful direction brings the rise and fall of a gangster to life.",
                  review: "Scorsese's best work! The pacing is relentless, and the performances are electric. Joe Pesci is terrifyingly brilliant. The 'Copacabana' tracking shot is legendary. A raw, authentic look at organized crime. Pure cinema. 9.5/10")
        ]
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMovieDetail",
           let detailVC = segue.destination as? MovieDetailViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            detailVC.movie = movies[indexPath.row]
        }
    }
}

// MARK: - UITableViewDataSource
extension MoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showMovieDetail", sender: nil)
    }
}
