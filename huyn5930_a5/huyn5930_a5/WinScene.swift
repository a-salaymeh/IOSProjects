//
//  WinScene.swift
//  huyn5930_a5
//
//  Created by Daniel H on 2020-03-24.
//  Copyright © 2020 Daniel H. All rights reserved.
//

import Foundation
import SpriteKit

class WinScene: SKScene {

    
    override init(size: CGSize) {
        super.init(size: size)
        backgroundColor = SKColor.white
        let label = SKLabelNode(fontNamed: "Courier")
        let label2 = SKLabelNode(fontNamed: "Courier")
        label.fontColor = SKColor.black
        label.fontSize = 30
        label.text = "You Win"
        label.position =  CGPoint(x:self.frame.midX, y:self.frame.midY);
        
        label2.fontColor = SKColor.black
        label2.fontSize = 20
        label2.text = "Going back to menu!"
        label2.position =  CGPoint(x:self.frame.midX, y:self.frame.midY-20);
        
        
        addChild(label)

        addChild(label2)
        
        
        let menu = SKAction.run() {
            let reveal = SKTransition.crossFade(withDuration: 0.5)
            let Scene = MenuScene(size: self.size)
            self.view?.presentScene(Scene, transition: reveal)
        }

        run(SKAction.sequence([SKAction.wait(forDuration: 3),menu]))

        

    } //init
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
} //winScene
