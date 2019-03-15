import Foundation

class MatchingGame {
    var cards = [Card]() // var cards: Array<Card>
    
    func chooseCard(at index: Int) {
//        cards[index].isFaceUp = !cards[index].isFaceUp
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            // 每次 append 的 card 都是新的 copy（傳值）
            cards += [card, card]
        }
    }
}
