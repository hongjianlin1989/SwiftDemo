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
    
    public var movieId: String? {
        return self.dic?["movieId"] as! String?
    }
    
    public var rank: String? {
        return self.dic?["rank"] as! String?
    }
    
    public var name: String? {
        return self.dic?["name"] as! String?
    }
    
   
    public var duration: String? {
        return self.dic?["duration"] as! String?
    }
    
    public var movieDescription: String? {
        return self.dic?["movieDescription"] as! String?
    }
   
    public var director: String? {
        return self.dic?["director"] as! String?
    }
   
    public var Actors: NSArray? {
        return self.dic?["Actors"] as! NSArray?
    }
    
    
}
