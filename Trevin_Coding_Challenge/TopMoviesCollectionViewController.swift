//
//  TopMoviesCollectionViewController.swift
//  Trevin_Coding_Challenge
//
//  Created by Trevin Wisaksana on 4/28/17.
//  Copyright © 2017 Trevin Wisaksana. All rights reserved.
//

import UIKit


class TopMoviesCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // List of movies
    var movieCollection = [Movie]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIClient.getTopMovies { (movies) in
            self.movieCollection.append(contentsOf: movies)
            self.collectionView?.reloadData()
        }
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieCollection.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "TopMovieCell",
            for: indexPath
            ) as! TopMovieCell
        
        let movie = movieCollection[indexPath.row]
        
        cell.configure(with: movie)
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let movie = movieCollection[indexPath.row]
        
        self.present(
            MovieDetailViewController(movieSelected: movie),
            animated: true,
            completion: nil
        )
        
    }

    
}

