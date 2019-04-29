//
//  MovieListCell.swift
//  Play Movie
//
//  Created by Jamisofttech on 17/04/2019.
//

import UIKit
import Kingfisher

class MovieListCell: UITableViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    private let baseURL = "https://image.tmdb.org/t/p/w342"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension MovieListCell {
    func cellDataSource(movie: Result) {
        self.movieImageView.kf.setImage(with: URL(string: baseURL + movie.posterPath))
        self.titleLabel.text = movie.title
    }
}
