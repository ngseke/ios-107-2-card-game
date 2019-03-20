import Foundation

class MatchingGame {
    var cards = [Card]() // var cards: Array<Card>
    var indexOfOneAndOnlyFaceUpCard: Int?   // 記錄已翻開牌之 id

    func chooseCard(at index: Int) {
        if !cards[index].isMatched {    // 已配對的牌不作用
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {    // 配對到了
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {    // 沒有翻到正面的牌 或 2張卡都在正面
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
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
