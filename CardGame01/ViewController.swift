import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        cardButtons.shuffle()
        
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!

    var emojiChoice = ["🎃", "🦊", "🐧", "😁", "🥟", "👽", "🐶", "🐣"]
    
    var emoji = [Int:String]()
    
    //    或:
    //    var emoji = Dictionary<Int, String>()
    //    var emoji:Dictionary<Int, String>
    
    // 使用 lazy 就無法使用 didSet
    
    lazy var game = MatchingGame(numberOfPairsOfCards: numberOfParisCard)
    
    var numberOfParisCard: Int{
        return (cardButtons.count + 1) / 2  // 是省略 get{} 的寫法
    }
    
    var flipCount:Int = 0
    {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("不在 collection 裡")
        }
        
        flipCount += 1
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            } else {
                if (!card.isMatched) {
                    button.setTitle("", for: UIControl.State.normal)
                }
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9411764741, green: 0.760784328, blue: 0.1490196139, alpha: 0.5036861796) : #colorLiteral(red: 0.9411764741, green: 0.760784328, blue: 0.1490196139, alpha: 1)
            }
        }
    }
    @IBAction func reset(_ sender: Any) {
        resetGame()
    }
    
    func resetGame () {
//        for index in cardButtons.indices {
//            card.isFaceUp = false
//            card.isMatched = false
//        }
//        flipCount = 0
//        emojiChoice = ["🎃", "🦊", "🐧", "😁", "🥟", "👽", "🐶", "🐣"]
//        game = MatchingGame(numberOfPairsOfCards: numberOfParisCard)
    }
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoice.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoice.count)))
            emoji[card.identifier] = emojiChoice.remove(at: randomIndex)    // pop
        }
        return emoji[card.identifier] ?? "?"
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

