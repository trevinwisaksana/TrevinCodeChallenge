//
//  MovieDetailViewController.swift
//  Trevin_Coding_Challenge
//
//  Created by Trevin Wisaksana on 4/29/17.
//  Copyright © 2017 Trevin Wisaksana. All rights reserved.
//

import UIKit
import SDWebImage


class MovieDetailViewController: UIViewController {
        
    @IBOutlet weak var movieTitleLabel: UILabel?
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    private var iTunesLink: URL?
    
    
    @IBAction func openiTunesButton(_ sender: UIButton) {
        // Unwrapping the iTunesLink
        if let itunesLink = iTunesLink {
            // Opening the iTunes App using the link           
            UIApplication.shared.openURL(itunesLink)
        }
    }
    
   
    @IBAction func backButton(_ sender: UIButton) {
        // Dismis the Movie Detail View Controller when tapped
        self.dismiss(
            animated: true,
            completion: nil
        )
        
    }
    
    
    /// Method that configures the UIElements of the MovieDetailViewController.
    ///
    /// - Parameter movie: It is type Movie
    public func configure(with movie: Movie) {
        // Setting the movie title
        movieTitleLabel?.text = movie.title
        
        // Setting the price label
        priceLabel.text = movie.price
        
        // Setting the releaseDateLabel
        releaseDateLabel.text = movie.releaseDate
        
        // Setting te poster image view
        posterImageView.sd_setImage(with: movie.posterLink)
        
        // Setting the link to open the movie from the iTunes app
        iTunesLink = movie.itunesLink
    }

}

