//
//  HeaderCell.swift
//  Instagram
//
//  Created by Cory Avra on 3/2/16.
//  Copyright © 2016 coryavra. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {

    // Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    
    // Variables
    var media: Post? {
        didSet {
            
            // Profile picture
            
            // Texts
            nameLabel.text = media?.name
            timestampLabel.text = media?.timestamp
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
