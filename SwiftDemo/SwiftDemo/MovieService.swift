//
//  MovieService.swift
//  SwiftDemo
//
//  Created by hongjian lin on 4/4/17.
//  Copyright © 2017 com.Tocaboca. All rights reserved.
//

import UIKit
import Alamofire

class MovieService: NSObject {

     let MovieServiceURLString = "https://interview.zocdoc.com/"
     let AllMoviesEndpointString = "api/1/FEE/AllMovies"
     let MoviesByRankEndpointString = "api/1/FEE/MoviesByRank"
     let MovieDetailsEndpointString = "api/1/FEE/MovieDetails"
    
    
   public func getListOfMovieWithRequest(req: MovieRequest, completion: @escaping (_ result: Array<Movie>) -> Void)
    {
       
        let strURL = MovieServiceURLString + self.AllMoviesEndpointString
        
        Alamofire.request(strURL , parameters: req.defaultParameters).responseJSON { response in
            debugPrint(response)
            
            if response.error != nil
            {
                debugPrint(response.error.debugDescription)
                completion([])
            }
            
            if let JSON = response.result.value as? NSArray{
            var movieArray : Array<Movie> = Array.init()
            for case let item as NSDictionary in JSON {
                let m = Movie.init(objDictionary: item)
                movieArray.append(m)
            }
             completion(movieArray)
            }

        }

    }
    
    public func getRankListOfMovieWithRequest(req: MovieRequest, completion: @escaping (_ result: Array<Movie>) -> Void)
    {
        
        let strURL = MovieServiceURLString + self.MoviesByRankEndpointString
        
        Alamofire.request(strURL , parameters: req.rankParameters as? Dictionary).responseJSON { response in
            debugPrint(response)
            if response.error != nil
            {
                debugPrint(response.error.debugDescription)
                completion([])
            }
            if let JSON = response.result.value as? NSArray{
                var movieArray : Array<Movie> = Array.init()
                for case let item as NSDictionary in JSON {
                    let m = Movie.init(objDictionary: item)
                    movieArray.append(m)
                }
                completion(movieArray)
            }
            
        }
        
    }
    
    
    public func getDetailListOfMovieWithRequest(req: MovieRequest, completion: @escaping (_ result: Array<Movie>) -> Void)
    {
        
        let strURL = MovieServiceURLString + self.MovieDetailsEndpointString + req.DetailUrl!
        
        Alamofire.request(strURL).responseJSON { response in
            debugPrint(response)
            if response.error != nil
            {
                debugPrint(response.error.debugDescription)
                completion([])
            }
            if let JSON = response.result.value as? NSArray{
                var movieArray : Array<Movie> = Array.init()
                for case let item as NSDictionary in JSON {
                    let m = Movie.init(objDictionary: item)
                    movieArray.append(m)
                }
                completion(movieArray)
            }
        }
        
    }


    
    
}
