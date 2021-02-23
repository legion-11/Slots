import SpriteKit
import GameplayKit

class Bet1 : GameObject {

    init() {
        super.init(imageString: "betOnebtn", initialScale: 2.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
