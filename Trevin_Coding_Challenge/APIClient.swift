//
//  APIClient.swift
//  Trevin_Coding_Challenge
//
//  Created by Trevin Wisaksana on 4/26/17.
//  Copyright © 2017 Trevin Wisaksana. All rights reserved.
//


import Alamofire
import SwiftyJSON

/*
 • What is an API?
 • What is the purpose of an API Client?
 
 API stands for Application Programming Interface. In simple, 
 
 
 */

struct APIClient {
    
    /*
     • Try to open this link on your browser
    */
    static private let itunesLink = URL(
        string: "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
    )
    
    
    /*
     • What is the purpose of the getTopMovies method?
     
     The purpose of this method is to retrieve the top 25 movies 
     from iTunes using the itunesLink above.
     
     Notice there's a "completion" parameter. This is called a
     completion handler. In simple, a completion handler is called 
     after the getTopMovies function completes its execution. It's 
     like calling two functions one after another.
     
     The completion handler returns a list of the top 25 Movies 
     from iTunes e.g. [Movie] so our collection view can display it.
     */
    
    
    /// A function that takes the top 25 movies from iTunes.
    ///
    /// - Parameter completion: Returns an array of Movie
    static func getTopMovies(completion: (([Movie]) -> Void)?) {
        
        guard let itunesLink = itunesLink else {
            return
        }
        
        /* 
         Alamofire allows us to make network requests to GET
         the top 25 movies. It also allows it to
        */
        Alamofire.request(itunesLink).responseJSON { (response) in
            // Check if we successfully get a response
            switch response.result {
            // If it's successful, let's get the data from the response
            case .success(let data):
                
                // Parsing the data to type JSON
                let json = JSON(data)
                /* This allows us to use SwiftyJSON's simple
                   type casting as seen below.
                */
                
                // Accessing the value from the JSON key "feed"
                guard let data = json["feed"].dictionary else {
                    return
                }
                
                // Accessing the value from the JSON key "entry"
                guard let entry = data["entry"]?.array else {
                    return
                }
                
                
                /*
                 • What does entry.flatMap(Movie.init) do?
                 This one line of code is responsible for creating
                 25 movies. In simple, it takes the data from 'entry'
                 and uses the Movie's init to
                */
                let topMoviesCollection = entry.flatMap(Movie.init)
                // The flattened array is then stored in the topMovies constant
                
                /* 
                 Here is where we determine what comes out of the
                 completion handler. In this case, it is the top 
                 25 movies that comes out.
                */
                completion?(topMoviesCollection)
                
            case .failure(_):
                return
            }
            
        }
        
    }
    
}
