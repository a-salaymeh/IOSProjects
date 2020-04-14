//
//  AddViewController.swift
//  huyn5930_a2
//
//  Created by Daniel H on 2020-02-15.
//  Copyright © 2020 Daniel H. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate  {

    @IBOutlet weak var fruitImage: UIImageView!
    @IBOutlet weak var fruitNameField: UITextField!
    
    @IBAction func fruitImageClicked(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.delegate = self
            present(imagePickerController, animated: true, completion: nil)
        
    }
    @IBAction func ReturnPressed(_ sender: Any) {
        fruitNameField.resignFirstResponder()

    }
    
    @IBAction func ScreenTapped(_ sender: Any) {
        fruitNameField.resignFirstResponder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        SharingFruitCollection.sharedFruitCollection.fruitCollection = sharedFruitCollection
//        SharingFruitCollection.sharedFruitCollection.saveFruitCollection()
//        SharingFruitCollection.sharedFruitCollection.loadFruitCollection()
        
            sharedFruitCollection = SharingFruitCollection.sharedFruitCollection.fruitCollection // if we forget thisline, the fruit collection is not the same collection of the sharing fruit collection!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
        
    func createAlert(fruitName: String ){
         let alert = UIAlertController(title: "Add a Fruit", message: "The Fruit \(fruitName) has been added.", preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
             self.present(alert, animated: true)
    }
    
    
    @IBAction func AddFruitPressed(_ sender: Any) {
        createAlert(fruitName: fruitNameField.text!)
        sharedFruitCollection!.addFruit(fruitObj: Fruit(fruitName:fruitNameField.text!, fruitImage: fruitImage.image!, likes: 0, disLikes: 0)!)
        fruitImage.image = UIImage(systemName: "questionmark")
        fruitNameField.text = ""
        SharingFruitCollection.sharedFruitCollection.fruitCollection = sharedFruitCollection
//         SharingFruitCollection.sharedFruitCollection.saveFruitCollection()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)
        
        guard let selectedImage = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage else{
            fatalError("Exoected a dictionary containing an image, but ws provided the following: \(info)")
        }
        info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.editedImage)]
        fruitImage.image = selectedImage
        dismiss(animated:true,completion:nil)
        
        
    }

    
    
        fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input:
    [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
    return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue,
    value)})
        }
        // Helper function inserted by Swift 4.2 migrator.
    fileprivate func convertFromUIImagePickerControllerInfoKey(_ input:
    UIImagePickerController.InfoKey) -> String {
    return input.rawValue
        }
        
}
