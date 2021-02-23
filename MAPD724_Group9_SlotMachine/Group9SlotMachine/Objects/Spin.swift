import SpriteKit
import GameplayKit

class Spin : GameObject {

    init() {
        super.init(imageString: "spinButton", initialScale: 2.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

