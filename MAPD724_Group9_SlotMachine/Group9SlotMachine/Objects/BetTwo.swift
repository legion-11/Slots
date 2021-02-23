import SpriteKit
import GameplayKit

class Bet10 : GameObject {

    init() {
        super.init(imageString: "betTwobtn", initialScale: 2.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
