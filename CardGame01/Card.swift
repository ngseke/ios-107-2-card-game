import Foundation

struct Card : Hashable {
    var isFaceUp = false
    var isMatched = false
    var identifier:Int  // use ID, not emoji
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier () -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init () {
        // 呼叫 static 的函式可以直接使用 Cards，不需要產生新的 instance
        self.identifier = Card.getUniqueIdentifier()
    }
}
