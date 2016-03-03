//
//  UserProfile.swift
//  Instagram
//
//  Created by Cory Avra on 3/2/16.
//  Copyright © 2016 coryavra. All rights reserved.
//

import UIKit
import Parse

class UserProfile: NSObject {

    class func uploadProfilePicture(image: UIImage?, withCompletion completion: PFBooleanResultBlock?) {
        // Create Parse object PFObject
        let userData = PFObject(className: "UserProfile")
        
        // Add relevant fields to the object
        userData["profilePicture"] = getPFFileFromImage(image) // PFFile column type
        
        // Save object (following function will save the object in Parse asynchronously)
        userData.saveInBackgroundWithBlock(completion)

    }
    
    class func updateUserData(aboutMe: String?, withCompletion completion: PFBooleanResultBlock?) {
        // Create Parse object PFObject
        let userData = PFObject(className: "UserProfile")
        
        // Add relevant fields to the object
        userData["name"] = PFUser.currentUser() // Pointer column type that points to PFUser
        userData["aboutMe"] = aboutMe
        
        // Save object (following function will save the object in Parse asynchronously)
        userData.saveInBackgroundWithBlock(completion)
    }
    
    class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        // check if image is not nil
        if let image = image {
            // get image data and check if that is not nil
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }
    
}
