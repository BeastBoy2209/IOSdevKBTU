//
//  MusicViewController.swift
//  Assignment8
//
//  View Controller для отображения списка музыки
//

import UIKit

class MusicViewController: UITableViewController {
    
    // MARK: - Properties
    var musicTracks: [Music] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadData()
        setupTableView()
    }
    
    // MARK: - Setup
    private func setupUI() {
        title = "Music"
        view.backgroundColor = .systemBackground
    }
    
    private func setupTableView() {
        tableView.rowHeight = 90
    }
    
    private func loadData() {
        musicTracks = [
            Music(title: "Bohemian Rhapsody", artist: "Queen", imageName: "music1",
                  description: "A groundbreaking six-minute suite, constantly reinventing itself, taken from their 1975 album A Night at the Opera. The song is a mix of opera, rock, and ballad, showcasing Freddie Mercury's incredible vocal range and the band's musical versatility. It remains one of the most iconic songs in rock history.",
                  review: "An absolute masterpiece that transcends genres! Freddie Mercury's vocals are out of this world. The operatic section is unlike anything else in rock. Every listen reveals something new. A timeless classic that will never be matched. 10/10"),
            
            Music(title: "Hotel California", artist: "Eagles", imageName: "music2",
                  description: "The title track from the Eagles' 1976 album of the same name. This song features one of the most famous guitar solos in rock history. The lyrics paint a vivid picture of excess and loss of innocence, often interpreted as a metaphor for the American music industry.",
                  review: "The guitar solo at the end is legendary! Don Henley's vocals perfectly capture the mysterious atmosphere. The lyrics are poetic and thought-provoking. A staple of classic rock that never gets old. 9.5/10"),
            
            Music(title: "Imagine", artist: "John Lennon", imageName: "music3",
                  description: "Released in 1971, this song has become an anthem of hope and peace. Lennon's simple yet powerful lyrics envision a world without conflict or division. The piano melody is instantly recognizable and has been covered by countless artists around the world.",
                  review: "Beautiful, hopeful, and timeless. Lennon's message of peace is more relevant than ever. The simplicity of the melody allows the powerful lyrics to shine. A song that can move anyone to tears. Pure perfection. 10/10"),
            
            Music(title: "Smells Like Teen Spirit", artist: "Nirvana", imageName: "music4",
                  description: "The song that brought grunge and alternative rock to the mainstream in 1991. Kurt Cobain's raw vocals and powerful guitar riff defined a generation. From the album Nevermind, it became an anthem for disaffected youth and changed the landscape of rock music.",
                  review: "Raw, powerful, and revolutionary! This song changed rock forever. Kurt Cobain's emotion is palpable. The guitar riff is instantly iconic. It captured the angst of a generation perfectly. Grunge at its absolute best. 9/10"),
            
            Music(title: "Billie Jean", artist: "Michael Jackson", imageName: "music5",
                  description: "From the legendary Thriller album (1982), this song features an unforgettable bassline and showcases Michael Jackson's incredible vocal talent. The song's music video revolutionized MTV and the music video industry. It's about a woman claiming that the narrator is the father of her child.",
                  review: "The King of Pop at his finest! That bassline is absolutely infectious. MJ's vocals and the production are flawless. The moonwalk debut in the music video is iconic. Pure pop perfection that still sounds fresh today. 10/10"),
            
            Music(title: "Stairway to Heaven", artist: "Led Zeppelin", imageName: "music6",
                  description: "Often cited as one of the greatest rock songs of all time, this 1971 epic builds from a gentle acoustic intro to a powerful rock crescendo. Jimmy Page's guitar solo is considered one of the best ever recorded. The song has become a cultural phenomenon and a staple of classic rock radio.",
                  review: "The greatest rock song ever created! The progression from acoustic to electric is masterful. Jimmy Page's guitar solo is transcendent. Robert Plant's vocals are perfect. Eight minutes of pure musical genius. 10/10"),
            
            Music(title: "Purple Rain", artist: "Prince", imageName: "music7",
                  description: "The title track from Prince's 1984 album and film. This power ballad features Prince's signature guitar work and emotional vocals. The live performances of this song are legendary, often extending beyond ten minutes with extended guitar solos that showcase Prince's virtuosity.",
                  review: "Prince's magnum opus! The guitar solo brings tears to my eyes every time. The emotion in his voice is overwhelming. A perfect blend of rock, pop, and soul. One of the greatest performances ever recorded. 10/10"),
            
            Music(title: "What's Going On", artist: "Marvin Gaye", imageName: "music8",
                  description: "Released in 1971, this socially conscious soul masterpiece addressed issues of war, poverty, and environmental destruction. Marvin Gaye's smooth vocals and the lush production created a new sound in soul music. The album of the same name is considered one of the greatest albums ever made.",
                  review: "Socially conscious and musically brilliant! Marvin Gaye's vocals are smooth as silk. The message is timeless and still relevant. Every instrument serves the song perfectly. A landmark in soul music. 9.5/10"),
            
            Music(title: "Like a Rolling Stone", artist: "Bob Dylan", imageName: "music9",
                  description: "Released in 1965, this six-minute single broke conventions and changed popular music forever. Dylan's biting lyrics and Al Kooper's iconic organ riff created something entirely new. Rolling Stone magazine named it the greatest song of all time in multiple polls.",
                  review: "Revolutionary and poetic! Dylan's lyrics are cutting and brilliant. The organ riff is unforgettable. It broke all the rules and changed music forever. Raw, honest, and powerful. A true masterpiece. 9/10"),
            
            Music(title: "Hey Jude", artist: "The Beatles", imageName: "music10",
                  description: "Written by Paul McCartney and released in 1968, this song was originally intended to comfort John Lennon's son Julian during his parents' divorce. The song features a four-minute coda with the famous 'na-na-na' sing-along, creating one of the most uplifting moments in pop music history.",
                  review: "Pure joy in musical form! Paul McCartney's vocals are heartfelt and powerful. The 'na-na-na' outro is one of the greatest moments in music. Uplifting, emotional, and perfectly crafted. The Beatles at their peak. 10/10")
        ]
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMusicDetail",
           let detailVC = segue.destination as? MusicDetailViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            detailVC.music = musicTracks[indexPath.row]
        }
    }
}

// MARK: - UITableViewDataSource
extension MusicViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicTracks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath) as? MusicTableViewCell else {
            return UITableViewCell()
        }
        
        let music = musicTracks[indexPath.row]
        cell.configure(with: music)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MusicViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showMusicDetail", sender: nil)
    }
}
