//
//  FruitCollection.swift
//  huyn5930_a1
//
//  Created by Daniel H on 2020-01-29.
//  Copyright © 2020 Daniel H. All rights reserved.
//

import Foundation


struct FruitCollection{
    static var collection = [Fruit]()
    static var current:Int = 0
    static var TotalFruit:Int = 0;

    
    init(){
        FruitCollection.collection.append(Fruit(fruitName: "Apple", fruitImageName: "apple.jpg"))
        FruitCollection.collection.append(Fruit(fruitName: "Pear", fruitImageName: "pear.jpg"))
        FruitCollection.collection.append(Fruit(fruitName: "Kiwi", fruitImageName: "kiwi.jpg"))
        FruitCollection.collection.append(Fruit(fruitName: "Banana", fruitImageName: "banana.jpg"))

        FruitCollection.TotalFruit = FruitCollection.collection.count


    }
    
    static func currentFruit()->Fruit{
        let fruit = FruitCollection.collection[FruitCollection.current]
        return fruit
    }
    
    static func setCurrentIndex(to index: Int){
        FruitCollection.current = index
    }
    
    
    static func nextFruit()->Fruit{
        current += 1
        if current == TotalFruit{
             current = 0;
         }
        let fruit = FruitCollection.collection[FruitCollection.current]
        return fruit

        
    }
    
    
    static func getCurrentIndex() -> Int{
        return FruitCollection.current
    }
    
}
