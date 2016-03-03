//
//  CaptureViewController.swift
//  Instagram
//
//  Created by Cory Avra on 2/29/16.
//  Copyright © 2016 coryavra. All rights reserved.
//

import UIKit

class CaptureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // Outlets
    @IBOutlet weak var currentImage: UIImageView!
    @IBOutlet weak var captionTextField: UITextField!
    
    // Variables
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Delegates
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        print("Got an image")
        
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        currentImage.contentMode = .ScaleAspectFit
        currentImage.image = chosenImage
        
        imagePicker.dismissViewControllerAnimated(true, completion: {
            // Anything you want to happen when the user saves an image
            print("Image Retrieved")
        })
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        print("User canceled image")
        
        dismissViewControllerAnimated(true, completion: {
            // Anything you want to happen when the user selects cancel
            print("Canceled")
        })
    }
    
    func scaleImage(image: UIImage, newSize: CGSize) -> UIImage {
        
        print("Resizing image...")

        let resizeImageView = UIImageView(frame: CGRectMake(0, 0, newSize.width, newSize.height))
        resizeImageView.contentMode = UIViewContentMode.ScaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        print("Image resized")
        
        return newImage
    }
    
    // Actions
    @IBAction func onTakePictureButton(sender: AnyObject) {
        
        if (UIImagePickerController.isSourceTypeAvailable(.Camera)) {
            if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .Camera
                imagePicker.cameraCaptureMode = .Photo
                presentViewController(imagePicker, animated: true, completion: {})
            } else {
                print("Rear camera doesn't exist")
            }
        } else {
            print("Camera is inaccessable")
        }
    }
    
    @IBAction func OnPhotoLibraryButton(sender: AnyObject) {
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func onUploadButton(sender: AnyObject) {
     
        let desiredSize = CGSize(width: 320, height: 320)
        
        if (currentImage.image != nil && captionTextField.text != "") {
            let resizedImage = scaleImage(currentImage.image!, newSize: desiredSize)
        
            UserMedia.postUserImage(resizedImage, withCaption: captionTextField.text) { (value: Bool, error: NSError?) -> Void in
                if (value) {
                    print("Posted successfully!")
                } else {
                    print(error?.localizedDescription)
                }
            }
        } else {
            print("Missing either the image or the caption!")
        }
        
        currentImage.image = nil
        captionTextField.text = ""
    }
    
}


