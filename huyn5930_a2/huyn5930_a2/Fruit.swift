//
//  Fruit.swift
//  huyn5930_a1
//
//  Created by Daniel H on 2020-01-29.
//  Copyright © 2020 Daniel H. All rights reserved.
//

import Foundation

struct Fruit{
    let fruitImageName:String
    let fruitName:String
    var likes = 0
    var dislikes = 0
    
    init(fruitName: String, fruitImageName:String){
        self.fruitImageName=fruitImageName
        self.fruitName=fruitName
    }
}
