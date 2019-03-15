import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButton: [UIButton]!
    
    var emojis = ["👻", "💩", "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🦝", "🐻", "🐼",  "🦘",  "🦡",  "🐨", "🐯", "🐤"]
    
    
    var flipCount:Int = 0
    {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBAction func reset(_ sender: UIButton) {
        for (index, i) in cardButton.enumerated() {
            flipcard(withEmoji: "", on: i, isAll: true)
        }
        flipCount = 0
        emojis.shuffle()
    }
    
    @IBAction func flipAll(_ sender: UIButton) {
        for (index, i) in cardButton.enumerated() {
            flipcard(withEmoji: emojis[index], on: i, isAll: true)
        }

    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButton.index(of: sender) {
            flipcard(withEmoji: emojis[cardNumber], on: sender)
        } else {
            print("oops")
        }
        
        flipCount += 1
    }
    
    // 令呼叫函式像是在讀英文
    func flipcard(withEmoji emoji: String, on button: UIButton, isAll: Bool = false) {
        if (button.currentTitle == emoji && !isAll) || emoji == "" {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.760784328, blue: 0.1490196139, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
    }
    
}

