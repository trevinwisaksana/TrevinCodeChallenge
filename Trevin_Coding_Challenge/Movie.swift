//
//  Movie.swift
//  Trevin_Coding_Challenge
//
//  Created by Trevin Wisaksana on 4/26/17.
//  Copyright © 2017 Trevin Wisaksana. All rights reserved.
//
//  PLEASE VISIT THE COMMENTS BELOW THE CODE


// SwiftyJSON will be used to parse the data we get from iTunes into JSON
import SwiftyJSON


/*
 The Movie struct is a blueprint of a Movie. As a
 blueprint, it's only an outline or a plan. In this case,
 it is an outline of what a Movie should have or what
 information a Movie should contain.
 
 In this tutorial, it should contain:
 • Title of the movie
 • Link to the poster image of the movie
 • Release date of the movie
 • Price of the movie
 
 We will use this to create a Movie based on the information
 the blueprint contains.
 */

struct Movie {
    
    // 3
    var title: String?
    var releaseDate: String?
    var price: String?
    var itunesLink: URL?
    var posterLink: URL?
    
    // 4 & 5
    init?(json: JSON) {
        
        // 6
        guard let title = json["im:name"]["label"].string else {
            return nil
        }
        
        guard let releaseDate = json["im:releaseDate"]["attributes"]["label"].string else {
            return nil
        }
        
        guard let price = json["im:price"]["label"].string else {
            return nil
        }
        
        guard let itunesLink = json["id"]["label"].url else {
            return nil
        }
        
        guard let posterLink = json["im:image"][2]["label"].url else {
            return nil
        }
        
        // 7
        self.title = title
        self.posterLink = posterLink
        self.releaseDate = releaseDate
        self.price = price
        self.itunesLink = itunesLink
        
    }
    
}


/*
 • What does the init do?
 
    • init is short for initializer 
    • When creating a Movie using the blueprint or the class 
      that we have created, we use the init to create the Movie
 
 • Why is there a question mark on the init?
 
    • init? is called a fail-able initializer 
    • A one sentence explanation of what it does would be: 
      "This blueprint will not allow you to create a Movie 
      if it's missing an information."
 
 Imagine that you create a Movie without a title, it wouldn't make
 sense. The fail-able initializer will prevent this from happening
 by failing the Movie from being created if it's missing an
 information.
 
 • Why does it need to take a type JSON?
 
 
 
 */
