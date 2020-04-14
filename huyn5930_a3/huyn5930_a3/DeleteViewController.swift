//
//  DeleteViewController.swift
//  huyn5930_a2
//
//  Created by Daniel H on 2020-02-15.
//  Copyright © 2020 Daniel H. All rights reserved.
//

import UIKit

class DeleteViewController: UIViewController {

    @IBOutlet weak var fruitName: UILabel!
    @IBOutlet weak var fruitImage: UIImageView!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        SharingFruitCollection.sharedFruitCollection.fruitCollection = sharedFruitCollection
//        SharingFruitCollection.sharedFruitCollection.saveFruitCollection()
        
        
        
            sharedFruitCollection = SharingFruitCollection.sharedFruitCollection.fruitCollection // if we forget thisline, the fruit collection is not the same collection of the sharing fruit collection!

//        SharingFruitCollection.sharedFruitCollection.loadFruitCollection()
        
        sharedFruitCollection = SharingFruitCollection.sharedFruitCollection.fruitCollection
        
        
        
        if (sharedFruitCollection?.getCount() == 0){
            fruitImage.image = UIImage(systemName: "questionmark")
                      fruitName.text = "No Fruit"
        }else{
    

            currentFruit = sharedFruitCollection?.currentFruit()
            fruitName.text=currentFruit?.getName()
            fruitImage.image=currentFruit!.getImage()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if (sharedFruitCollection?.getCount() != 0){

        currentFruit = sharedFruitCollection?.currentFruit()
        fruitName.text=currentFruit?.getName()
        fruitImage.image=currentFruit!.getImage()
        }else{
            fruitImage.image = UIImage(systemName: "questionmark")
                fruitName.text = "No Fruit"
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func DeleteButtonPressed(_ sender: Any) {
//                        print("Current Fruit Index: \(sharedFruitCollection?.currentIndex())")
        
        
        if (sharedFruitCollection?.getCount() == 0){
            let alert = UIAlertController(title: "No Fruit", message: "The Fruit Collection is Empty.", preferredStyle: .alert)
                      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                      self.present(alert, animated: true)

        }else{
            
            let alert = UIAlertController(title: "Deleted Fruit", message: "\(sharedFruitCollection?.currentFruit().getName()) has been removed.", preferredStyle: .alert)
                      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                      self.present(alert, animated: true)
            
            sharedFruitCollection?.removeCurrentFruit()
            
            

        }
                        print("Current Fruit Index: \(sharedFruitCollection?.currentIndex())")
        
        
                if (sharedFruitCollection?.getCount() == 0){

                    fruitImage.image = UIImage(systemName: "questionmark")
                                  fruitName.text = "No Fruit"
                }else{
                    currentFruit = sharedFruitCollection?.currentFruit()
                    fruitName.text=currentFruit?.getName()
                    fruitImage.image=currentFruit!.getImage()
                }
    }
    
    @IBAction func NextButtonPressed(_ sender: Any) {
        print("Next Button Pressed")
        
        if (sharedFruitCollection?.getCount() == 0 ){
                let alert = UIAlertController(title: "Add a Fruit", message: "There are no Fruits to interact with.", preferredStyle: .alert)
                       alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                       self.present(alert, animated: true)
        }else{
        sharedFruitCollection?.incrementCurrent()
        currentFruit = sharedFruitCollection?.currentFruit()
        fruitName.text=currentFruit?.getName()
        fruitImage.image=currentFruit!.getImage()
        }
    }



}
