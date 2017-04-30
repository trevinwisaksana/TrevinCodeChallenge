//
//  TopMovieCell.swift
//  Trevin_Coding_Challenge
//
//  Created by Trevin Wisaksana on 4/28/17.
//  Copyright © 2017 Trevin Wisaksana. All rights reserved.
//

import UIKit
import SDWebImage


class TopMovieCell: UICollectionViewCell {
    
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var posterImage: UIImageView!
    
    func configure(with movie: Movie) {
        movieTitleLabel.text = movie.title
        releaseDateLabel.text = movie.releaseDate
        priceLabel.text = movie.price
        posterImage.sd_setImage(with: movie.posterLink)
    }
    
}
