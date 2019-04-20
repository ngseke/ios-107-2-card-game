import Foundation

class MatchingGame {
    var cards = [Card]() // var cards: Array<Card>
    var count:Int = 0
    var score:Int = 0
    
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
            count += 1
            
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                
                if cards[matchIndex].identifier == cards[index].identifier {
                    // [配對到了]
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2  // 加分
                } else {
                    // [配對錯]
                    if cards[matchIndex].isSeen || cards[index].isSeen {
                        // 任一張有牌有翻過
                        if cards[matchIndex].isSeen && cards[index].isSeen {
                            // 2 張都翻過
                            score -= 2
                        }
                        else {
                            // 只翻過 1 張
                            score -= 1
                        }
                    }
                    cards[matchIndex].isSeen = true
                    cards[index].isSeen = true
                }
                cards[index].isFaceUp = true
            } else if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex == index {
                cards[index].isFaceUp = false
                indexOfOneAndOnlyFaceUpCard = nil
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
    
    func flipAll () {
        var isAllFlipped = true
    
        for index in cards.indices {
            if !(cards[index].isFaceUp && cards[index].isMatched) {
                isAllFlipped = false
            }
        }
        if (!isAllFlipped) {
            for index in cards.indices {
                cards[index].isFaceUp = true
                cards[index].isMatched = true
            }
        } else {
            for index in cards.indices {
                cards[index].isFaceUp = false
                cards[index].isMatched = false
                count = 0
            }
        }
    }
}
