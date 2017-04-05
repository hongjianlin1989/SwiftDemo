//
//  MovieRequest.swift
//  SwiftDemo
//
//  Created by hongjian lin on 4/4/17.
//  Copyright © 2017 com.Tocaboca. All rights reserved.
//

import UIKit

class MovieRequest: NSObject {

    var movieIds: NSArray?
    var numMovies :NSNumber?
    var startRankIndex :NSNumber?
    
    let authToken = "3b502b3f-b1ff-4128-bd99-626e74836d9c"

    override init() {
    }
    
    init(movieIds:NSArray) {
        self.movieIds=movieIds
    }
    
    init(startRankIndex:NSNumber , numMovies:NSNumber)
    {
        self.numMovies = numMovies
        self.startRankIndex = startRankIndex
    }
    
   
    public var defaultParameters: Dictionary<String, Any> {
        let Dict = ["authToken" : authToken]
        return Dict
    }

    public var rankParameters: NSDictionary? {
        let Dict = ["authToken": authToken, "numMovies": numMovies! as NSNumber, "startRankIndex": startRankIndex! as NSNumber] as NSDictionary
        return Dict
    }
    
    
    public var DetailUrl: NSString? {
        var url = "authToken=" + authToken
        for case let item as String in self.movieIds! {
            url = url + "&movieIds=" + item
        }
        return url as NSString?
    }
    
    
    
}
