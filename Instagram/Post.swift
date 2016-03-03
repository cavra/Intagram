//
//  Post.swift
//  Instagram
//
//  Created by Cory Avra on 3/2/16.
//  Copyright © 2016 coryavra. All rights reserved.
//

import UIKit
import Parse

class Post: NSObject {
    
    // Variables
    var photoFile: PFFile?
    
    var name: String?
    var caption: String?
    var timestamp: String?
    
    var likesCount: Int = 0
    var CommentsCount: Int = 0
    
    // Deserialize the PFObject
    init(media: PFObject) {
        super.init()
        
        // Get the PFFile that houses theimage
        photoFile = media["media"] as? PFFile

        // Set the texts
        name = media["author"]["username"] as? String
        caption = media["caption"] as? String
        
        // Parse the timestamp
        let timestampDate = media["timestamp"] as? NSDate
        if let timestampDate = timestampDate {
            timestamp = parseDate(timestampDate)
        }
        
        // Keep track of counts
        likesCount = (media["favorite_count"] as? Int) ?? 0
        CommentsCount = (media["retweet_count"] as? Int) ?? 0
        
    }
    
    class func postsWithArray(dictionaries: [PFObject]) -> [Post] {
        // Convert an array of PFObjects to an array of Posts
        var posts = [Post]()
        for object in dictionaries {
            posts.append(Post(media: object))
        }
        return posts
    }
    
    func parseDate(date: NSDate?) -> String? {
        
        //@todo rewrite this
        if (date == nil) {
            return nil
        }
        
        var outputTime: String = ""
        let calendar = NSCalendar.autoupdatingCurrentCalendar()
        let components = calendar.components([.Year, .Month, .Day, .Hour, .Minute, .Second], fromDate: date!, toDate: NSDate(), options: [])
        
        if (components.year > 1) {
            outputTime = "\(components.year) years ago"
        } else if (components.month > 1) {
            outputTime = "\(components.month) months ago"
        } else if (components.day > 1) {
            outputTime = "\(components.day) days ago"
        } else if (components.hour > 1) {
            outputTime = "\(components.hour)h"
        } else if (components.minute > 1) {
            outputTime = "\(components.minute)m"
        } else {
            outputTime = "\(components.second)s"
        }
        
        return outputTime
    }
    
}
