//
//  TrailersVC.swift
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

class TrailersVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var loader = MovieLoader()
    var trailers: Trailer?
    var movie: Result?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCells()
        self.loadTrailers()
    }
}

extension TrailersVC {
    private func registerCells() {
        self.tableView.register(UINib(nibName: String(describing: TrailersCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TrailersCell.self))
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    private func loadTrailers() {
        if appUtility.connectedToNetwork() {
            appUtility.loadingView(self, wantToShow: true)
            self.loader.getTrailers(movie: self.movie!, successBlock: { (trailer) in
                appUtility.loadingView(self, wantToShow: false)
                self.trailers = trailer
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

extension TrailersVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let trailer = self.trailers {
            return trailer.results.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TrailersCell.self), for: indexPath) as! TrailersCell
        cell.cellDateSource(trailer: self.trailers!.results[indexPath.row])
        return cell
    }
}

extension TrailersVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isIPad {
            return 120
        }
        return UITableView.automaticDimension
    }

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//		XCDYouTubeClient.default().getVideoWithIdentifier(self.trailers!.results[indexPath.row].key) { (video, error) in
//			if error == nil {
//
//			}
//		}

		let video = self.trailers!.results[indexPath.row]
		let playerVC = AVPlayerViewController()

		present(playerVC, animated: true, completion: nil)
		
		XCDYouTubeClient.default().getVideoWithIdentifier(video.key) {[weak self, weak playerVC] (video, error) in
			if let _ = error {
				self?.dismiss(animated: true, completion: nil)
				return
			}
			guard let video = video else {
				self?.dismiss(animated: true, completion: nil)

				return
			}

			let streamURL: URL
			if let url = video.streamURLs[XCDYouTubeVideoQuality.HD720.rawValue]  {
				streamURL = url
			} else if let url = video.streamURLs[XCDYouTubeVideoQuality.medium360.rawValue] {
				streamURL = url
			} else if let url = video.streamURLs[XCDYouTubeVideoQuality.small240.rawValue] {
				streamURL = url
			} else if let urlDict = video.streamURLs.first {
				streamURL = urlDict.value
			} else {
				self?.dismiss(animated: true, completion: nil)

				return
			}
			playerVC?.player = AVPlayer(url: streamURL)
			playerVC?.player?.play()

		}
	}
}
