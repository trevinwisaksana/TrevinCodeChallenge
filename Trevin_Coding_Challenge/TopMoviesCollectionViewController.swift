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
        // Getting the top 25 movies from iTunes
        retrieveMovies()
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Getting the number of movies to display an equal amount of cells in the CollectionView
        let numberOfMovies = movieCollection.count
        
        return numberOfMovies
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // SetupCell returns a dequeueReusableCell
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
        // Assigning the dequeueRequsableCell as the TopMovieCell
        let cell = self.collectionView?.dequeueReusableCell(
            withReuseIdentifier: "TopMovieCell",
            for: indexPath
            ) as! TopMovieCell
        
        // Storing a movie from the movieCollection
        let movie = movieCollection[indexPath.row]
        
        // Configuring the UIElements of the cell
        cell.configure(with: movie)
        
        return cell
    }
    
    /// Retrieves the top 25 movie from iTunes
    fileprivate func retrieveMovies() {
        // Calls the getTopMovies method from the APIClient
        APIClient.getTopMovies { [unowned self] (movies) in
            // Adding the movies retrieved from iTunes
            self.movieCollection.append(contentsOf: movies)
            // Refreshing the collection view because we're adding new data
            self.collectionView?.reloadData()
        }
    }
    
}

