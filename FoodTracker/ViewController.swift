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

    //MARK: Actions
    @IBAction func selectImageFromImageLibrary(_ sender: UITapGestureRecognizer) {
        //Hides the Keyboard
        nameTextField.resignFirstResponder()
        //UIImagePickerController is a control that allows users pick media from their photo library
        let imagePickerController = UIImagePickerController()
        
        //Only allows photos to be picked, not taken
        imagePickerController.sourceType = .photoLibrary
    }

    @IBAction func setDefaultLabelButton(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
}

