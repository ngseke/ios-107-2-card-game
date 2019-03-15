import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    var emojis = ["👻", "💩"]
    
    var flipCount:Int = 0
    {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipcard(withEmoji: "👻", on: sender)
        flipCount += 1
    }
    
    @IBAction func touchCardPoop(_ sender: UIButton) {
        flipcard(withEmoji: "💩", on: sender)
        flipCount += 1
    }
    
    // 令呼叫函式像是在讀英文
    func flipcard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.760784328, blue: 0.1490196139, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
    }
    
}

