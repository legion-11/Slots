import SpriteKit
import GameplayKit

class Background : GameObject {
    
    init() {
        super.init(imageString: "background", initialScale: 2.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
