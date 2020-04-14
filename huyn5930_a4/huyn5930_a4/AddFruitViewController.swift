//
//  AddViewController.swift
//  huyn5930_a2
//
//  Created by Daniel H on 2020-02-15.
//  Copyright © 2020 Daniel H. All rights reserved.
//

import UIKit
import os.log

class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate  {

    @IBOutlet weak var fruitImage: UIImageView!
    @IBOutlet weak var fruitNameField: UITextField!
    //@IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var fruitAdded: Fruit!

    let segueID = "AddBackToTableSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitNameField.delegate=self
        updateSaveButtonState()

    }
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
    }

    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    
    func getFruit()->Fruit{
        let fruit = Fruit(fruitName: fruitNameField.text!, fruitImage: fruitImage.image!, likes: 0, disLikes: 0)!
        //let fruit = fruitAdded
        return fruit
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //print(segue.identifier)
        //if segue.identifier == segueID{
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            
              os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
              return
          }
           // print("Test")
            //_ = segue.destination as! ViewController
            fruitAdded = Fruit(fruitName: fruitNameField.text!, fruitImage: fruitImage.image!, likes: 0, disLikes: 0)
            //AddFruit(fruit: Fruit(fruitName: fruitNameField.text!, fruitImage: fruitImage.image!, likes: 0, disLikes: 0)!)

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
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = fruitNameField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
}

