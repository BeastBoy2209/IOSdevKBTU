import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var trackPic: UIImageView!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var prevBut: UIButton!
    @IBOutlet weak var playBut: UIButton!
    @IBOutlet weak var nextBut: UIButton!
    @IBOutlet weak var scale: UISlider!
    
    var player: AVAudioPlayer!
    var songs = ["Adele - Skyfall", "Alicia Keys - Empire State Of Mind", "БОРИК & ХЛЕБ - Тыцн-дыцн", "Скриптонит - Это Любовь"]
    var currentSongIndex = 0
    var playing = false
    var timer: Timer?
    
    func loadSong() {
            let songName = songs[currentSongIndex]
            
            if let path = Bundle.main.path(forResource: songName, ofType: "mp3") {
                let url = URL(fileURLWithPath: path)
                
                do {
                    player = try AVAudioPlayer(contentsOf: url)
                    player.prepareToPlay()
                    
                    trackLabel.text = songName
                    trackPic.image = UIImage(named: songName)
                    
                    scale.minimumValue = 0
                    scale.maximumValue = Float(player.duration)
                    scale.value = 0
                    
                    player.play()
                    playing = true
                    
                    
                    let playImage = UIImage(systemName: "pause.circle.fill")
                    playBut.setImage(playImage, for: .normal)
                    startTimer()
                    
                } catch {
                    print("Ошибка при загрузке \(songName): \(error.localizedDescription)")
                }
            } else {
                print("Файл не найден: \(songName).mp3")
            }
        }
        
        @IBAction func playTapped(_ sender: UIButton) {
            guard let player = player else { return }
            
            if playing {
                player.pause()
                playing = false
                let playImage = UIImage(systemName: "play.circle.fill")
                playBut.setImage(playImage, for: .normal)
            } else {
                player.play()
                playing = true
                let pauseImage = UIImage(systemName: "pause.circle.fill")
                playBut.setImage(pauseImage, for: .normal)
            }
        }
        
        @IBAction func nextTapped(_ sender: UIButton) {
            currentSongIndex = (currentSongIndex + 1) % songs.count
            loadSong()
        }
        
        @IBAction func prevTapped(_ sender: UIButton) {
            currentSongIndex = (currentSongIndex - 1 + songs.count) % songs.count
            loadSong()
        }
        
        @IBAction func scaleValueChanged(_ sender: UISlider) {
            guard let player = player else { return }
            player.currentTime = TimeInterval(sender.value)
            
            if !player.isPlaying && playing {
                player.play()
            }
        }
        
        @objc func updateSlider() {
            guard let player = player else { return }
            scale.value = Float(player.currentTime)
        }
        
        func startTimer() {
            timer?.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 0.5,
                                         target: self,
                                         selector: #selector(updateSlider),
                                         userInfo: nil,
                                         repeats: true)
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            prevBut.setImage(UIImage(systemName: "backward.fill"), for: .normal)
            nextBut.setImage(UIImage(systemName: "forward.fill"), for: .normal)
            playBut.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
            
            prevBut.tintColor = .label
            nextBut.tintColor = .label
            playBut.tintColor = .label
            
            scale.addTarget(self, action: #selector(scaleValueChanged(_:)), for: .valueChanged)
            
            loadSong()
        }
    }
