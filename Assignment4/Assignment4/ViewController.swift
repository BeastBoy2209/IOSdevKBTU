import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var rouletteWheel: UIImageView!
    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    let sectors = [
        0, 32, 15, 19, 4, 21, 2, 25, 17, 34, 6, 27, 13, 36, 11, 30,
        8, 23, 10, 5, 24, 16, 33, 1, 20, 14, 31, 9, 22, 18, 29, 7, 28,
        12, 35, 3, 26
    ]
    
    lazy var sectorAngle = 2 * Double.pi / Double(sectors.count)
    var currentAngle: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rouletteWheel.contentMode = .scaleAspectFit
        resultLabel.text = ""
    }
    
    @IBAction func spinButtonTapped(_ sender: UIButton) {
        spinButton.isEnabled = false
        resultLabel.text = "Spinning..."
        startSpin()
    }
    
    func startSpin() {
        let targetIndex = Int.random(in: 0..<sectors.count)
        let rotations = Double.random(in: 3...6)
        
        // Рассчитываем угол так, чтобы нужный сектор оказался вверху
        let targetAngle = -Double(targetIndex) * sectorAngle
        let finalAngle = rotations * 2 * Double.pi + targetAngle
        
        CATransaction.begin()
        CATransaction.setCompletionBlock { [weak self] in
            guard let self = self else { return }
            
            self.currentAngle = finalAngle
            
            var normalizedAngle = -self.currentAngle  // Инвертируем, так как крутим против часовой
            normalizedAngle.formTruncatingRemainder(dividingBy: 2 * Double.pi)
            if normalizedAngle < 0 {
                normalizedAngle += 2 * Double.pi
            }
            
            let sectorIndex = Int((normalizedAngle + self.sectorAngle / 2) / self.sectorAngle) % self.sectors.count
            
            self.rouletteWheel.layer.transform = CATransform3DMakeRotation(CGFloat(self.currentAngle), 0, 0, 1)
            
            self.spinButton.isEnabled = true
            let resultNumber = self.sectors[sectorIndex]
            self.resultLabel.text = "Выпало число: \(resultNumber)"
            print("Выпало число: \(resultNumber), угол: \(normalizedAngle), индекс: \(sectorIndex)")
        }
        
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = currentAngle
        animation.toValue = finalAngle
        animation.duration = 3.0
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        
        rouletteWheel.layer.add(animation, forKey: "spinAnimation")
        CATransaction.commit()
    }
}
