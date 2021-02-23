import SpriteKit
import GameplayKit

class BetLine : GameObject {
    // Initializers
    init() {
        // initialize the object with an image
        super.init(imageString: "bet_line", initialScale: 2.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
