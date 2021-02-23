import SpriteKit
import GameplayKit

class REEL1 : GameObject {

    init() {
        super.init(imageString: "banana", initialScale: 1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
