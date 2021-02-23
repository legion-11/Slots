import SpriteKit
import GameplayKit

class BetMax : GameObject {

    init() {
        super.init(imageString: "betMaxbtn", initialScale: 2.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
