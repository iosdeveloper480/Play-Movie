//
//  MovieDetailVC.swift
//  Play Movie
//
//  Created by WADIC on 18/04/2019.
//  Copyright © 2019 jamisofttech. All rights reserved.
//

import UIKit
import Kingfisher
import AVFoundation
import AVKit
import XCDYouTubeKit

class MovieDetailVC: UIViewController {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var result: Result?
    let loader = MovieLoader()
	let transition = CircularTransition()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadMovieDetail()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension MovieDetailVC {
    private func loadMovieDetail() {
        if appUtility.connectedToNetwork() {
            appUtility.loadingView(self, wantToShow: true)
            self.loader.getMovieDetail(movie: self.result!, successBlock: { (movieDetails) in
                
                appUtility.loadingView(self, wantToShow: false)
                self.setupUI(detail: movieDetails)
                
            }) { (error) in
                appUtility.loadingView(self, wantToShow: false)
                appUtility.showBanner(self, title: "Oops", subTitle: error.localizedDescription, image: nil, backgroundColor: UIColor.clear, wantToShow: true)
            }
        }else {
            appUtility.showBanner(self, title: "No Internet", subTitle: "No Internet connection", image: nil, backgroundColor: UIColor.clear, wantToShow: true)
        }
    }
    
    private func setupUI(detail: MovieDetail) {
        let urlString = "https://image.tmdb.org/t/p/w342\(detail.posterPath!)"
        self.movieImageView.kf.setImage(with: URL(string:urlString))
        
        self.titleLabel.text = detail.title
        var genres = ""
        for gen in detail.genres {
            genres = genres + gen.name + ", "
        }
        self.genresLabel.text = genres
        
        let movieDate = Date.date2(fromString: detail.releaseDate)
        self.dateLabel.text = "\(movieDate!.day).\(movieDate!.getMonth).\(movieDate!.year)"
        
        self.overviewLabel.text = detail.overview
    }
}

extension MovieDetailVC {
    @IBAction func watchTrailerAction() {
        let trailersVC = UIStoryboard.storyBoard(withName: .movieDetail).loadViewController(withIdentifier: .trailersVC) as! TrailersVC
        trailersVC.movie = self.result
		trailersVC.transitioningDelegate = self
		trailersVC.modalPresentationStyle = .custom
        self.present(trailersVC, animated: true) {
            
        }
    }
}

extension MovieDetailVC: UIViewControllerTransitioningDelegate {
	func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		transition.transitionMode = .present
		transition.startingPoint = self.view.center
		transition.circleColor = .clear

		return transition
	}

	func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		transition.transitionMode = .dismiss
		transition.startingPoint = self.view.center
		transition.circleColor = .clear

		return transition
	}
}
