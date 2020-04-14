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
    @IBOutlet weak var FruitName: UILabel!
    var currentFruit : Fruit?

    
    func initWithData(_ fruit : Fruit){
        currentFruit = fruit
    }
    
    func setup(){
        LikeCount.text=String(currentFruit!.getLikes())
        DislikeCount.text=String(currentFruit!.getDislikes())
        FruitName.text=currentFruit?.getName()
        FruitImage.image=currentFruit!.getImage()
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Starting App")
        setup()
    }
    
    

    @IBAction func nextButtonPressed(_ sender: Any) {
//        var index = sharedFruitCollection!.currentIndex()
//        index += 1
//        if (index > (sharedFruitCollection?.getCount())!){
//            index = 0
//        }
        sharedFruitCollection?.incrementCurrent()
        
        currentFruit = sharedFruitCollection?.currentFruit()
        LikeCount.text=String(currentFruit!.getLikes())
        DislikeCount.text=String(currentFruit!.getDislikes())
        FruitName.text=currentFruit?.getName()
        FruitImage.image=currentFruit!.getImage()
    }
    
    @IBAction func likedButtonPressed(_ sender: Any) {
        print("Liked Button Pressed")
                currentFruit!.addLike()
                LikeCount.text=String(currentFruit!.getLikes())

    }

    @IBAction func dislikeButtonPressed(_ sender: Any) {
        print("Dislike Button Pressed")
        currentFruit!.addDislike()
        DislikeCount.text=String(currentFruit!.getDislikes())

    }
}

