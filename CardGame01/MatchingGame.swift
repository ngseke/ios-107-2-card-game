import Foundation

class MatchingGame {
    var cards = [Card]() // var cards: Array<Card>
    var indexOfOneAndOnlyFaceUpCard: Int? {    // 記錄已翻開牌之 id
        get {
            var foundIndex:Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {   // 原本寫作 set (newValue) { ... }
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {    // 已配對的牌不作用
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {    // 配對到了
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {    // 沒有翻到正面的牌 或 2張卡都在正面
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
