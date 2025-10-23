import UIKit

class ViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var rouletteWheel: UIImageView!
    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var betAmountField: UITextField!
    @IBOutlet weak var betNumberField: UITextField!
    @IBOutlet weak var betTypeSegment: UISegmentedControl!
    
    // MARK: - Data
    let sectors = [
        0, 32, 15, 19, 4, 21, 2, 25, 17, 34, 6, 27, 13, 36, 11, 30,
        8, 23, 10, 5, 24, 16, 33, 1, 20, 14, 31, 9, 22, 18, 29, 7, 28,
        12, 35, 3, 26
    ]
    
    let redNumbers: Set<Int> = [32, 19, 21, 25, 34, 27, 36, 30,
                                23, 5, 16, 1, 14, 9, 18, 7, 12, 3]
    
    var currentAngle: Double = 0
    lazy var sectorAngle = 2 * Double.pi / Double(sectors.count)
    var balance: Int = 1000 // фикс балик
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        rouletteWheel.contentMode = .scaleAspectFit
        resultLabel.text = ""
        updateBalanceLabel()
    }
    
    func updateBalanceLabel() {
        balanceLabel.text = "Balance: \(balance)"
    }
    
    // MARK: - Actions
    @IBAction func spinButtonTapped(_ sender: UIButton) {
        guard let betText = betAmountField.text,
              let bet = Int(betText),
              bet > 0 else {
            resultLabel.text = "Введите ставку!"
            return
        }
        
        if bet > balance {
            resultLabel.text = "Недостаточно средств!"
            return
        }
        
        balance -= bet
        updateBalanceLabel()
        resultLabel.text = "Spinning..."
        spinButton.isEnabled = false
        startSpin(bet: bet)
    }
    
    // MARK: - Spin logic
    func startSpin(bet: Int) {
        let targetIndex = Int.random(in: 0..<sectors.count)
        let rotations = Double.random(in: 3...6)
        let targetAngle = -Double(targetIndex) * sectorAngle
        let finalAngle = rotations * 2 * Double.pi + targetAngle
        
        CATransaction.begin()
        CATransaction.setCompletionBlock { [weak self] in
            guard let self = self else { return }
            
            self.currentAngle = finalAngle
            var normalizedAngle = -self.currentAngle
            normalizedAngle.formTruncatingRemainder(dividingBy: 2 * Double.pi)
            if normalizedAngle < 0 { normalizedAngle += 2 * Double.pi }
            
            let sectorIndex = Int((normalizedAngle + self.sectorAngle / 2) / self.sectorAngle) % self.sectors.count
            let resultNumber = self.sectors[sectorIndex]
            
            self.handleResult(resultNumber, bet: bet)
            self.spinButton.isEnabled = true
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
    
    func handleResult(_ result: Int, bet: Int) {
        let choice = betTypeSegment.selectedSegmentIndex // 0 — число, 1 — красное, 2 — черное
        var win = 0
        
        if choice == 0 { // ставка на число
            if let chosenText = betNumberField.text,
               let chosen = Int(chosenText),
               chosen == result {
                win = bet * 36
            }
        } else if choice == 1 { // красное
            if redNumbers.contains(result) {
                win = bet * 2
            }
        } else if choice == 2 { // черное
            if !redNumbers.contains(result) && result != 0 {
                win = bet * 2
            }
        }
        
        if win > 0 {
            balance += win
            resultLabel.text = "Выпало \(result)! Вы выиграли \(win) 🎉"
        } else {
            resultLabel.text = "Выпало \(result)! Проигрыш 😞"
        }
        
        updateBalanceLabel()
    }
}
