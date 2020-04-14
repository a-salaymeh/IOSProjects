//
//  ViewController.swift
//  Assignment1
//
//  Created by Daniel H on 2020-01-14.
//  Copyright © 2020 Daniel H. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    struct Fruit{
        var likes:Int!
        var dislikes:Int!
        var imagepath:UIImage?
    }

    @IBOutlet weak var FruitImage: UIImageView!
    @IBOutlet weak var LikeCount: UILabel!
    @IBOutlet weak var DislikeCount: UILabel!
    
    
    var CurrentFruit:Int = 0;
    var TotalFruit:Int = 0;
    
    var FruitsArray: [Fruit]=[];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FruitsArray.append(Fruit(likes: 0, dislikes: 0, imagepath: (UIImage(named: "apple.jpg"))))
        FruitsArray.append(Fruit(likes: 0, dislikes: 0, imagepath: (UIImage(named: "banana.jpg"))))
        FruitsArray.append(Fruit(likes: 0, dislikes: 0, imagepath: (UIImage(named: "pear.jpg"))))
        FruitsArray.append(Fruit(likes: 0, dislikes: 0, imagepath: (UIImage(named: "kiwi.jpg"))))

        TotalFruit = FruitsArray.count
        
        LikeCount.text =  String(FruitsArray[CurrentFruit].likes)
        DislikeCount.text = String(FruitsArray[CurrentFruit].dislikes)
        FruitImage.image = FruitsArray[CurrentFruit].imagepath


        


    }
    
    
    @IBAction func NextButtonPressed(_ sender: Any) {
        print("Next Button Pressed")
        CurrentFruit+=1;
        if CurrentFruit == TotalFruit{
            CurrentFruit = 0;
        }
        
        print(CurrentFruit)
        LikeCount.text =  String(FruitsArray[CurrentFruit].likes)
         DislikeCount.text = String(FruitsArray[CurrentFruit].dislikes)
         FruitImage.image = FruitsArray[CurrentFruit].imagepath
        
    }
    
    @IBAction func rightButtonPressed(_ sender: Any) {
        print("Like Button Pressed")
        
        self.FruitsArray[CurrentFruit].likes+=1
        LikeCount.text =  String(FruitsArray[CurrentFruit].likes)

    
    }
    
    @IBAction func leftButtonPressed(_ sender: Any) {
        print("Dislike Button Pressed")
        self.FruitsArray[CurrentFruit].dislikes+=1
        DislikeCount.text =  String(FruitsArray[CurrentFruit].dislikes
        )


    }
}

