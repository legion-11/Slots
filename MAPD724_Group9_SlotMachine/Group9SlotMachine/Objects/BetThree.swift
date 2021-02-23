import SpriteKit
import GameplayKit

class Bet100 : GameObject {

    init() {
        super.init(imageString: "betThreebtn", initialScale: 2.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

