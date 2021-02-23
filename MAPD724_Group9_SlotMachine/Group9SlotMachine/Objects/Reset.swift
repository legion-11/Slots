import SpriteKit
import GameplayKit

class Reset : GameObject {

    init() {
        super.init(imageString: "resetButton", initialScale: 2.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


