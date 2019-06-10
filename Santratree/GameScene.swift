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
        
        // 1. Dectect what sprit was touched
        let spriteTouched = self.atPoint(mousePosition)
        print("You Touced: \(spriteTouched)")
        
        // 2. check if he touched tree
        if(spriteTouched.name == "tree")
        {
            print("Tree Touched")
            
        }
        
        
    }
    
}
