//
//  Movie.swift
//  SwiftDemo
//
//  Created by hongjian lin on 4/4/17.
//  Copyright © 2017 com.Tocaboca. All rights reserved.
//

import UIKit

class Movie: NSObject {

    public var dic:NSDictionary?
    
    init(objDictionary:NSDictionary) {
        dic = objDictionary
    }
    
    public var movieId: NSNumber? {
    
        return self.dic?["Id"] as? NSNumber
    }
    
    public var rank: String? {
        return self.dic?["Rank"] as! String?
    }
    
    public var name: String? {
        return self.dic?["Name"] as! String?
    }
    
   
    public var duration: String? {
        return self.dic?["Duration"] as! String?
    }
    
    public var movieDescription: String? {
        return self.dic?["Description"] as! String?
    }
   
    public var director: String? {
        return self.dic?["Director"] as! String?
    }
   
    public var Actors: NSArray? {
        return self.dic?["Actors"] as! NSArray?
    }
    
    
}
