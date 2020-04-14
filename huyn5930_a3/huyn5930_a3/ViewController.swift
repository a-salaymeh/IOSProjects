//
//  ViewController.swift
//  Assignment1
//
//  Created by Daniel H on 2020-01-14.
//  Copyright © 2020 Daniel H. All rights reserved.
//

import UIKit
var sharedFruitCollection : FruitCollection?
var currentFruit : Fruit?


class ViewController: UIViewController {

    @IBOutlet weak var DislikeCount: UILabel!
    @IBOutlet weak var LikeCount: UILabel!
    @IBOutlet weak var FruitImage: UIImageView!
    @IBOutlet weak var FruitName: UILabel!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //print("Current Fruit Collection Size \(sharedFruitCollection?.getCount())")
        //print("Current Fruit Index Size \(sharedFruitCollection?.currentIndex())")


        
        SharingFruitCollection.sharedFruitCollection.fruitCollection = sharedFruitCollection

//        SharingFruitCollection.sharedFruitCollection.saveFruitCollection()
        
  
//        SharingFruitCollection.sharedFruitCollection.loadFruitCollection()
//
        sharedFruitCollection = SharingFruitCollection.sharedFruitCollection.fruitCollection // if we forget thisline, the fruit collection is not the same collection of the sharing fruit collection!

        
        for Fruit in sharedFruitCollection!.collection {
            print(Fruit.fruitName)
            
        }
//
        if (sharedFruitCollection?.getCount() == 0){
          //  currentFruit = sharedFruitCollection?.currentFruit()

            LikeCount.text = ""
              DislikeCount.text = ""
              FruitImage.image = UIImage(systemName: "questionmark")
              FruitName.text = "No Fruit"
        }else{
            currentFruit = sharedFruitCollection?.currentFruit()

            LikeCount.text=String(currentFruit!.getLikes())
            DislikeCount.text=String(currentFruit!.getDislikes())
            FruitName.text=currentFruit?.getName()
            FruitImage.image=currentFruit!.getImage()
  
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Starting App")

        _ = SharingFruitCollection()
        SharingFruitCollection.sharedFruitCollection.fruitCollection = FruitCollection()
               //initialize only once
        SharingFruitCollection.sharedFruitCollection.loadFruitCollection()
        sharedFruitCollection = SharingFruitCollection.sharedFruitCollection.fruitCollection
        
        
        if (sharedFruitCollection?.getCount() == 0){

            LikeCount.text = ""
                       DislikeCount.text = ""
                       FruitImage.image = UIImage(systemName: "questionmark")
                       FruitName.text = "No Fruit"
        }else{
            currentFruit = sharedFruitCollection?.currentFruit()

            LikeCount.text=String(currentFruit!.getLikes())
            DislikeCount.text=String(currentFruit!.getDislikes())
            FruitName.text=currentFruit?.getName()
            FruitImage.image=currentFruit!.getImage()
     
        }

        
        print("Current Fruit Collection Size \(sharedFruitCollection?.getCount())")
        
        //print("Current Fruit Index: \(sharedFruitCollection?.currentIndex())")//
    }
    
    
    @IBAction func NextButtonPressed(_ sender: Any) {
        print("Next Button Pressed")
        
        
        sharedFruitCollection?.incrementCurrent()
        
        //print("Current Fruit Index: \(sharedFruitCollection?.currentIndex())")
        if (sharedFruitCollection?.getCount() == 0 ){
                let alert = UIAlertController(title: "Add a Fruit", message: "There are no Fruits to interact with.", preferredStyle: .alert)
                       alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                       self.present(alert, animated: true)
        }else{
        currentFruit = sharedFruitCollection?.currentFruit()
        LikeCount.text=String(currentFruit!.getLikes())
        DislikeCount.text=String(currentFruit!.getDislikes())
        FruitName.text=currentFruit?.getName()
        FruitImage.image=currentFruit!.getImage()
        }

    }
    

    @IBAction func likedButtonPressed(_ sender: Any) {
        print("Liked Button Pressed")
        
        if (sharedFruitCollection?.getCount() == 0 ){
                let alert = UIAlertController(title: "Add a Fruit", message: "There are no Fruits to interact with.", preferredStyle: .alert)
                       alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                       self.present(alert, animated: true)
        }else{

                currentFruit!.addLike()
                LikeCount.text=String(currentFruit!.getLikes())
        }
    }
    
    
    @IBAction func dislikeButtonPressed(_ sender: Any) {
        
                print("Dislike Button Pressed")
        
        if (sharedFruitCollection?.getCount() == 0){
            let alert = UIAlertController(title: "Add a Fruit", message: "There are no Fruits to interact with.", preferredStyle: .alert)
                       alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                       self.present(alert, animated: true)
        }else{
                currentFruit!.addDislike()
                DislikeCount.text=String(currentFruit!.getDislikes())
        }
    }
}

