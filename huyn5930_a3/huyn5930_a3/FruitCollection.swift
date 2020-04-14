//
//  FruitCollection.swift
//  huyn5930_a1
//
//  Created by Daniel H on 2020-01-29.
//  Copyright © 2020 Daniel H. All rights reserved.
//


import Foundation
import UIKit

class FruitCollection: NSObject, NSCoding {
   var collection = [Fruit]() // a collection is an array of fruits
   var current:Int = 0 // the current fruit in the collection shown in scene
   
    let collectionKey = "collectionKey"
    let currentKey = "currentKey"
   
    // MARK: - NSCoding methods
       override init(){
           super.init()
           setup()
       }
   
       required convenience init?(coder decoder: NSCoder) {
        self.init()
        collection = (decoder.decodeObject(forKey: collectionKey) as? [Fruit])!
        current = (decoder.decodeInteger(forKey: currentKey))
       }
   
       func encode(with acoder: NSCoder) {
           acoder.encode(collection, forKey: collectionKey)
             acoder.encode(current, forKey: currentKey)
       }
    
    func currentIndex() -> Int{
        return self.current
    }
    func getCount()->Int{
        return collection.count
    }
    
    
    func currentFruit() ->Fruit{
        return collection[self.current]
    }
    
    
    func incrementCurrent(){
        self.current += 1
        
        if (self.current == self.collection.count){
            self.current = 0
        }
    }
    func addFruit(fruitObj: Fruit){
        collection.append(fruitObj)
    }
    
    func removeCurrentFruit(){

        if (self.current == self.collection.count - 1){
            collection.remove(at: current)

                self.current = 0
            }
        else{
            collection.remove(at: current)

        }
        
//        return deleted.fruitName
        
    }
    
    func setup(){
        self.collection.append(Fruit(fruitName: "Apple", fruitImage: UIImage(named: "apple.jpg")!, likes: 0, disLikes: 0)!)
        self.collection.append(Fruit(fruitName: "Pear", fruitImage: UIImage(named: "pear.jpg")!, likes: 0, disLikes: 0)!)
        self.collection.append(Fruit(fruitName: "Kiwi", fruitImage: UIImage(named: "kiwi.jpg")!, likes: 0, disLikes: 0)!)
        self.collection.append(Fruit(fruitName: "Banana", fruitImage: UIImage(named: "banana.jpg")!, likes: 0, disLikes: 0)!)

    }
   
}
