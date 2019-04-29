//
//  MovieListVC.swift
//  Play Movie
//
//  Created by WADIC on 18/04/2019.
//  Copyright © 2019 jamisofttech. All rights reserved.
//

import UIKit

class MovieListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies: Movie?
    let loader = MovieLoader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCells()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadMoviesList()
    }
}

extension MovieListVC {
    private func registerCells() {
        self.tableView.register(UINib(nibName: String(describing: MovieListCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MovieListCell.self))
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    private func loadMoviesList() {
        if appUtility.connectedToNetwork() {
            appUtility.loadingView(self, wantToShow: true)
            self.loader.getMoviesList(parameters: nil, successBlock: { (movie) in
                
                appUtility.loadingView(self, wantToShow: false)
                self.movies = movie
                self.tableView.reloadData()
                
            }) { (error) in
                appUtility.loadingView(self, wantToShow: false)
                appUtility.showBanner(self, title: "Oops", subTitle: error.localizedDescription, image: nil, backgroundColor: UIColor.clear, wantToShow: true)
            }
        }else {
            appUtility.showBanner(self, title: "No Internet", subTitle: "No Internet connection", image: nil, backgroundColor: UIColor.clear, wantToShow: true)
        }
    }
}

extension MovieListVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let movie = self.movies {
            return movie.results.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MovieListCell.self), for: indexPath) as! MovieListCell
        if let movie = self.movies {
            cell.cellDataSource(movie: movie.results[indexPath.row])
        }
        return cell
    }
}

extension MovieListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieDetailVC = UIStoryboard.storyBoard(withName: .movieDetail).loadViewController(withIdentifier: .movieDetailVC) as! MovieDetailVC
        movieDetailVC.result = self.movies!.results[indexPath.row]
        self.navigationController?.pushViewController(movieDetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isIPad {
            return 190
        }
        return 80
    }
}
