//
//  TableViewController.swift
//  huyn5930_a3
//
//  Created by Daniel H on 2020-02-27.
//  Copyright © 2020 Daniel H. All rights reserved.
//

import UIKit
import Foundation
let customCellIdentifier = "reuseIdentifier"
let segueID = "FavouriteFruitSegue"

class CustomCell: UITableViewCell{
    @IBOutlet weak var fruitName: UILabel!
    @IBOutlet weak var fruitImage: UIImageView!
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var dislikeCount: UILabel!
}

var sharedFruitCollection : FruitCollection?

class TableViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (sharedFruitCollection?.getCount())!

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            var cell = tableView.dequeueReusableCell(withIdentifier: customCellIdentifier, for: indexPath) as? CustomCell
              
              if (cell == nil){
                  cell = CustomCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: customCellIdentifier) as CustomCell
              }
              
        cell?.fruitName.text = sharedFruitCollection?.getFruitAt( index: indexPath.row).fruitName
        
        cell?.fruitImage.image = sharedFruitCollection?.getFruitAt(index: indexPath.row).getImage() 
        
//        cell?.dislikeCount.text = "Dislikes: \(String(describing: sharedFruitCollection!.getFruitAt(index: indexPath.row).getDislikes()))"
//
//
//             cell?.likeCount.text = "Likes \(String(describing: sharedFruitCollection!.getFruitAt(index: indexPath.row).getLikes()))"
              return cell!
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action,tableView, completionHandler) in
            sharedFruitCollection?.deleteFruitAt(index: indexPath.row)
            //print(sharedFruitCollection?.getFruit(indexPath.row))
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
//            for fruit in sharedFruitCollection!.collection
//            {
//                print(fruit.getName())
//            }
        }
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeConfiguration
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
          _ = SharingFruitCollection()
          SharingFruitCollection.sharedFruitCollection.fruitCollection = FruitCollection()
        
        
                 //initialize only once
        
        
          SharingFruitCollection.sharedFruitCollection.loadFruitCollection()
          sharedFruitCollection = SharingFruitCollection.sharedFruitCollection.fruitCollection
          
        
//        for Fruit in sharedFruitCollection!.collection {
//              print(Fruit.fruitName)
//        }
//
        
        // Do any additional setup after loading the view.
    }
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: segueID, sender: sharedFruitCollection?.collection[indexPath.row])
        sharedFruitCollection?.setCurrentIndex(index: indexPath.row)
        //print(sharedFruitCollection?.collection[indexPath.row].fruitName)
    }

//
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueID{
            let FruitVC = segue.destination as! ViewController
            FruitVC.initWithData(sender as! Fruit)
        }
    }

    
    @IBAction func unwindToTableView(_ sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? AddViewController {
            let fruit =  sourceViewController.getFruit()
            sharedFruitCollection?.addFruit(fruitObj: fruit)
            tableView.reloadData()
        }else if let sourceViewController = sender.source as? ViewController{
            tableView.reloadData()
        }
    }
    

    
}
