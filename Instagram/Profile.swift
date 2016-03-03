//
//  Profile.swift
//  Instagram
//
//  Created by Cory Avra on 3/2/16.
//  Copyright © 2016 coryavra. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class Profile: UIView {

    // Outlets
    @IBOutlet weak var profilePictureImageView: UIImage!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userInfoLabel: UILabel!
    
    // Variables
    var user: User? {
        didSet {

            // Images
            //profilePictureImageView.file = user?.profilePic
            //profilePictureImageView.loadInBackground()
            
            // Texts
            nameLabel.text = user?.name ?? "Bob"
            userInfoLabel.text = user?.aboutMe ?? "Bob is hungry"
        }
    }
    
}
