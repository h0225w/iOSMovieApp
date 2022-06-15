//
//  ViewController.swift
//  iOSMovieApp
//
//  Created by 박현우 on 2022/06/13.
//

import UIKit

class MovieListViewController: UIViewController {
    let movieListService = MovieList()
    
    @IBOutlet weak var tableView: UITableView!
    
    var movieList: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        movieListService.getMovieList(nil) { data in
            self.movieList = data
            self.tableView.reloadData()
        }
    }
}

// MARK: - Extension
private extension MovieListViewController {
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MovieListTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieListCell")
    }
}

// MARK: - UITableViewDelegate, UITableViewDatasource
extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell", for: indexPath) as! MovieListTableViewCell
        
        let data = movieList[indexPath.row]
        
        cell.update(Movie(title: data.title, image: data.image, director: data.director, actor: data.actor, userRating: data.userRating))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
}
