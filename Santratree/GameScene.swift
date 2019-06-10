//
//  GameScene.swift
//  Santratree
//
//  Created by MacStudent on 2019-06-10.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let locationTouched = touches.first
        
        if (locationTouched == nil) {
            // This is error handling
            // Sometimes the mouse detection doesn't work properly
            // and IOS can't get the position.
            return
        }
        
        let mousePosition = locationTouched!.location(in:self)
        
        print("MOUSE X?  \(mousePosition.x)")
        print("MOUSE Y?  \(mousePosition.y)")
        print("------")
    }
    
}
