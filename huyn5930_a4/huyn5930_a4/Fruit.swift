//
//  Fruit.swift
//  huyn5930_a1
//
//  Created by Daniel H on 2020-01-29.
//  Copyright © 2020 Daniel H. All rights reserved.
//

import Foundation
import UIKit
import os.log

class Fruit: NSObject, NSCoding {
   let fruitImage : UIImage
   let fruitName : String
   var likes : Int
   var dislikes : Int

   struct PropertyKey {
    static let fruitImage = "fruitImage"
    static let fruitName = "fruitName"
    static let likes = "likes"
    static let disLikes = "disLikes"
    }
   
    func encode(with aCoder: NSCoder) {
    aCoder.encode(fruitName, forKey: PropertyKey.fruitName)
    aCoder.encode(fruitImage, forKey: PropertyKey.fruitImage)
    aCoder.encode(likes, forKey: PropertyKey.likes)
    aCoder.encode(dislikes, forKey: PropertyKey.disLikes)
    }
   
   required convenience init?(coder aDecoder: NSCoder) {
   
           // The name is required. If we cannot decode a name string, the initializer should fail.
       
           guard let nameDecoded = aDecoder.decodeObject(
                   forKey: PropertyKey.fruitName) as? String else {
               os_log("Unable to decode the name for a fruit.",
                      log: OSLog.default, type: .debug)
               return nil
           }
     // Because photo is an optional property of Meal, just use conditional cast.
    let imageDecoded = (aDecoder.decodeObject(forKey: PropertyKey.fruitImage) as? UIImage)!
    let likesDecoded = aDecoder.decodeInteger(forKey: PropertyKey.likes) as Int
    let disLikesDecoded = aDecoder.decodeInteger(forKey: PropertyKey.disLikes) as Int
    // Must call designated initializer.
    self.init(fruitName: nameDecoded, fruitImage: imageDecoded , likes: likesDecoded , disLikes: disLikesDecoded)
    }
    init?(fruitName: String, fruitImage: UIImage, likes: Int, disLikes: Int) {
        self.fruitName = fruitName
        self.fruitImage = fruitImage
        self.likes = likes
        self.dislikes = disLikes
    } //init?
    
    func addLike(){
        self.likes+=1
    }
    
    func addDislike(){
        self.dislikes+=1
    }
    func getLikes()->Int{
        return self.likes
    }
    func getDislikes()->Int{
        return self.dislikes
    }
    func getImage()->UIImage{
        return self.fruitImage
    }
    func getName()->String{
        return self.fruitName
    }
    
    
}
