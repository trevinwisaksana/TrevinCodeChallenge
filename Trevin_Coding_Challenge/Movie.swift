//
//  Movie.swift
//  Trevin_Coding_Challenge
//
//  Created by Trevin Wisaksana on 4/26/17.
//  Copyright © 2017 Trevin Wisaksana. All rights reserved.
//
//  PLEASE VISIT THE COMMENTS BELOW THE CODE

import UIKit
// 1
import SwiftyJSON

// 2
class Movie {
    
    // 3
    var title: String?
    var releaseDate: String?
    var price: String?
    var itunesLink: String?
    var posterLink: URL?
    
    // 4 & 5
    init?(json: JSON) {
        
        // 6
        guard let data = json["feed"].dictionary else {
            return nil
        }
        
        guard let entry = data["entry"]?.dictionary else {
            return nil
        }
        
        guard let title = entry["im:name"]?["label"].string else {
            return nil
        }
        
        guard let releaseDate = entry["im:releaseDate"]?["attributes"]["label"].string else {
            return nil
        }
        
        guard let price = entry["im:price"]?["label"].string else {
            return nil
        }
        
        guard let itunesLink = entry["id"]?["label"].string else {
            return nil
        }
        
        guard let posterLink = entry["im:image"]?["label"].url else {
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
 The Movie class is a blueprint of a Movie. As a
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
