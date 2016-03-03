//
//  FeedCell.swift
//  Instagram
//
//  Created by Cory Avra on 2/29/16.
//  Copyright © 2016 coryavra. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class ContentCell: UITableViewCell {

    // Outlets
    @IBOutlet weak var photoView: PFImageView!
    
    @IBOutlet weak var captionLabel: UILabel!

    @IBOutlet weak var likesCountLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    
    // Variables
    var media: Post? {
        didSet {
            
            // Main image
            photoView.file = media?.photoFile
            photoView.loadInBackground()

            // Texts
            captionLabel.text = media?.caption
            
            // Counts
            if (media?.likesCount == 1) {
                likesCountLabel.text = "\((media?.likesCount)!) Like"
            } else if (media?.likesCount != nil) {
                likesCountLabel.text = "\((media?.likesCount)!) Likes"
            } else {
                likesCountLabel.text = "0"
            }
            if (media?.CommentsCount == 1) {
                commentCountLabel.text = "\((media?.CommentsCount)!) Comment"
            } else if (media?.CommentsCount != nil) {
                commentCountLabel.text = "\((media?.CommentsCount)!) Comments"
            } else {
                commentCountLabel.text = "0"
            }
        }
    }
  
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        // Set the default first
        let defaultBackgroundView = UIView()
        defaultBackgroundView.backgroundColor = .None
        self.backgroundView = defaultBackgroundView
        
        // Followed by the selected style
        let selectedBackgroundView = UIView()
        selectedBackgroundView.backgroundColor = UIColor.lightGrayColor()
        self.selectedBackgroundView = selectedBackgroundView
    }
    
}
