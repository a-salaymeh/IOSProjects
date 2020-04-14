//
//  ViewController.swift
//  Assignment1
//
//  Created by Daniel H on 2020-01-14.
//  Copyright © 2020 Daniel H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var DislikeCount: UILabel!
    @IBOutlet weak var LikeCount: UILabel!
    @IBOutlet weak var FruitImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = FruitCollection()

        if let i = UserDefaults.standard.integer(forKey: "currentIndex") as Int? {
        print("Fruits existed with index: \(i)")
        FruitCollection.setCurrentIndex(to: i) //restore the fruit
        }
        
        let fruit = FruitCollection.currentFruit()

        LikeCount.text =  String(fruit.likes)
        DislikeCount.text = String(fruit.dislikes)
        FruitImage.image=(UIImage(named: fruit.fruitImageName))
     //   FruitImage.image = FruitsArray[CurrentFruit].imagepath
//
//
//


    }
    
    
    @IBAction func NextButtonPressed(_ sender: Any) {
        print("Next Button Pressed")
        
        let newfruit = FruitCollection.nextFruit()
//
        LikeCount.text =  String(newfruit.likes)
        DislikeCount.text = String(newfruit.dislikes)
        FruitImage.image=(UIImage(named: newfruit.fruitImageName))
//
//        UserDefaults.standard.set(FruitCollection.getCurrentIndex(), forKey: "currentIndex")
        
    }
    
    @IBAction func rightButtonPressed(_ sender: Any) {
        print("Like Button Pressed")
        FruitCollection.collection[FruitCollection.current].likes += 1

    
        LikeCount.text =  String(FruitCollection.collection[FruitCollection.current].likes)
//
//
    }
    
    @IBAction func leftButtonPressed(_ sender: Any) {
//        var fruit = FruitCollection.currentFruit()
        print("Dislike Button Pressed")
        FruitCollection.collection[FruitCollection.current].dislikes += 1


    DislikeCount.text =  String(FruitCollection.collection[FruitCollection.current].dislikes)
////        )
////
        let fruit = FruitCollection.currentFruit()
        DislikeCount.text =  String(fruit.dislikes)

    }
}

