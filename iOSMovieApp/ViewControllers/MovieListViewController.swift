//
//  ViewController.swift
//  iOSMovieApp
//
//  Created by 박현우 on 2022/06/13.
//

import UIKit

class MovieListViewController: UIViewController {
    let movieList = MovieList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieList.getMovieList(nil)
    }
}
