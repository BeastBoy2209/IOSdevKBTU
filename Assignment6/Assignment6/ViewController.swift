import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var trackPic: UIImageView!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var prevBut: UIButton!
    @IBOutlet weak var playBut: UIButton!
    @IBOutlet weak var nextBut: UIButton!
    
    var player: AVAudioPlayer!
    var songs = ["Adele - Skyfall", "Alicia Keys - Empire State Of Mind", "БОРИК & ХЛЕБ - Тыцн-дыцн", "Скриптонит - Это Любовь"]
    var currentSongIndex = 0
    var playing = false
    
    func loadSong() {
        let songName = songs[currentSongIndex]
        
        
        if let path = Bundle.main.path(forResource: songName, ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player.prepareToPlay()
                
                trackLabel.text = songName
                trackPic.image = UIImage(named: songName)
                
                player.play()
                playing = true
                
            } catch {
                print("Ошибка при загрузке \(songName): \(error.localizedDescription)")
            }
        } else {
            print("⚠️ Файл не найден: \(songName).mp3")
        }
    }
    
    @IBAction func playTapped(_ sender: UIButton) {
            if player == nil { return }
            
            if playing {
                player.pause()
                playing = false
                playBut.setImage(UIImage(systemName: "play.fill"), for: .normal)
            } else {
                player.play()
                playing = true
                playBut.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            }
        }
        
    @IBAction func nextTapped(_ sender: UIButton) {
            currentSongIndex += 1
            if currentSongIndex >= songs.count {
                currentSongIndex = 0
            }
            loadSong()
    }
        
    @IBAction func prevTapped(_ sender: UIButton) {
            currentSongIndex -= 1
            if currentSongIndex < 0 {
                currentSongIndex = songs.count - 1
            }
            loadSong()
    }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            loadSong()
        }
    }

