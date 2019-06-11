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
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
    }
    
    // keep track of all the cat objects on the screen
    var oranges:[SKSpriteNode] = []
    
    func makeOrange(xPosition:CGFloat, yPosition:CGFloat) {
        // lets add some cats
        let orange = SKSpriteNode(imageNamed: "Orange")
        
        orange.position = CGPoint(x:xPosition, y:yPosition)
        orange.zPosition = 100
        
        
        //add phuysics to the orange
        
        // physicsBody is HitBox of IOS
        orange.physicsBody = SKPhysicsBody(circleOfRadius: orange.size.width / 2)
        // 2. Add make oange afftected by physics
        
        //by defalut, a physics body has a:
        // dynamic == true
        // affectedbygravity == true
        orange.physicsBody?.isDynamic = true
        
        // add the cat to the scene
        addChild(orange)
        
        let throwOrange = SKAction.applyImpulse(CGVector(dx:50, dy:100),duration: 0.5)
        orange.run(throwOrange)
        
        // add the cat to the cats array
        self.oranges.append(orange)
        
        print("Where is orange? \(xPosition), \(yPosition)")
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
            makeOrange(xPosition: mousePosition.x, yPosition: mousePosition.y)
        }
        
        
    } // end touchBegan
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let locationTouched = touches.first
        
        if (locationTouched == nil) {
            // This is error handling
            // Sometimes the mouse detection doesn't work properly
            // and IOS can't get the position.
            return
        }
        
        let mousePosition = locationTouched!.location(in:self)
        
        print("Ending (x,y): \(mousePosition.x) , \(mousePosition.y)")
        print("------")
        
    }
    
}
