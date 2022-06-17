//
//  ViewController.swift
//  iOSMovieApp
//
//  Created by 박현우 on 2022/06/13.
//

import UIKit

class MovieListViewController: UIViewController {
    let movieListService = MovieList()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var movieList: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupSearchBar()
        search("")
    }
}

// MARK: - Extension
private extension MovieListViewController {
    // MARK: TableView 설정
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MovieListTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieListCell")
    }
    
    // MARK: SearchBar 설정
    func setupSearchBar() {
        searchBar.delegate = self
    }
    
    // MARK: 영화 목록 > 검색 기능
    func search(_ query: String?) {
        movieListService.getMovieList(Search(query: query, genre: 0)) { data in
            self.movieList = data
            self.tableView.reloadData()
        }
    }
    
    // MARK: 검색 후 키보드 내려가도록
    func dismissKeyboard() {
        searchBar.resignFirstResponder() // 첫 번째 응답자 사임
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


// MARK: - UISearchBarDelegate
extension MovieListViewController: UISearchControllerDelegate, UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, query.isEmpty == false else { return }
        
        dismissKeyboard()
        search(query)
    }
}
