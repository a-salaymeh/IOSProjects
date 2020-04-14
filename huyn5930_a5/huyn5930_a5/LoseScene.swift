//
//  LoseScene.swift
//  huyn5930_a5
//
//  Created by Daniel H on 2020-03-24.
//  Copyright © 2020 Daniel H. All rights reserved.
//

import Foundation
import SpriteKit
class LoseScene: SKScene {
    
    var backButton : SKSpriteNode?
    
    override init(size: CGSize) {
        super.init(size: size)
        backgroundColor = SKColor.white

  let label = SKLabelNode(fontNamed: "Courier")
               label.fontColor = SKColor.black
               label.fontSize = 30
               label.text = "You lose."
               label.position =  CGPoint(x:self.frame.midX, y:self.frame.midY);
               self.addChild(label)
        
        
        let home = SKAction.run() {
            let reveal = SKTransition.crossFade(withDuration: 0.5)
                 let Scene = MenuScene(size: self.size)
                 self.view?.presentScene(Scene, transition: reveal)
             }
             let delay = SKAction.wait(forDuration: 3)
             let ret = SKAction.sequence([delay,home])
             self.run(ret)
             
 
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


