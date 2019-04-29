//
//  TrailersCell.swift
//  Play Movie
//
//  Created by WADIC on 18/04/2019.
//  Copyright © 2019 jamisofttech. All rights reserved.
//

import UIKit

class TrailersCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension TrailersCell {
    func cellDateSource(trailer: TrailerResult) {
        self.titleLabel.text = trailer.name
    }
}
