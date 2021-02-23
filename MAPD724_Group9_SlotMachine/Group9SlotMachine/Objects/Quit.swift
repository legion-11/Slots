import SpriteKit
import GameplayKit

class Quit : GameObject {

    init() {
        super.init(imageString: "quitButton", initialScale: 2.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


