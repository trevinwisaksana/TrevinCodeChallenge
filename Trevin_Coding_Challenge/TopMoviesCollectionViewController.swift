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
        
        retrieveMovies()
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let numberOfMovies = movieCollection.count
        
        return numberOfMovies
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = setupCell(with: indexPath)
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Presenting the view controller
        presentViewController(with: indexPath.row)
        
    }
    
    
    fileprivate func presentViewController(with index: Int) {
        
        // Storing the selected movie in a constant
        let movie = movieCollection[index]
        
        // Retrieving the MovieDetailViewController from the storyboard
        let movieDetailViewController = storyboard?.instantiateViewController(
            withIdentifier: "MovieDetailViewController"
            ) as! MovieDetailViewController
        
        // Presenting the Movie Detail View Controller
        present(
            movieDetailViewController,
            animated: true,
            completion: nil
        )
        
        // Configuring the UI with the movie data
        movieDetailViewController.configure(with: movie)
        
    }
    
    
    fileprivate func setupCell(with indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.collectionView?.dequeueReusableCell(
            withReuseIdentifier: "TopMovieCell",
            for: indexPath
            ) as! TopMovieCell
        
        let movie = movieCollection[indexPath.row]
        
        cell.configure(with: movie)
        
        return cell
    }
    
    
    fileprivate func retrieveMovies() {
        APIClient.getTopMovies { (movies) in
            self.movieCollection.append(contentsOf: movies)
            self.collectionView?.reloadData()
        }
    }
    
}

