//
//  ViewController.swift
//  FoodTracker
//
//  Created by Christine W on 10/13/17.
//  Copyright © 2017 Christine W. All rights reserved.
//

import UIKit
//extends UIViewController
class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK: Properties

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        //MARK: hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField){
        mealNameLabel.text = textField.text
    }
    
    //imagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //dismisses the controller if canceled
        dismiss(animated: true, completion: nil)
    }
    
    //gets called if the user picks an object
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //the info dictionary can contain multiple versions of the image. You want to use the original
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as?
            UIImage else {
                fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
            }
            //setPhotoImageView to display image
            photoImageView.image = selectedImage
            //dismiss the picker
            dismiss(animated: true, completion: nil)
    }
    //MARK: Actions
    @IBAction func selectImageFromImageLibrary(_ sender: UITapGestureRecognizer) {
        //Hides the Keyboard
        nameTextField.resignFirstResponder()
        //UIImagePickerController is a control that allows users pick media from their photo library
        let imagePickerController = UIImagePickerController()
        
        //Only allows photos to be picked, not taken
        imagePickerController.sourceType = .photoLibrary
        
        //makes sure the ViewController is notified when the user picks an image
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    

    @IBAction func setDefaultLabelButton(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
}

