//
//  MovieFilmsCell.swift
//  SwiftDemo
//
//  Created by hongjian lin on 4/4/17.
//  Copyright © 2017 com.Tocaboca. All rights reserved.
//

import UIKit

class MovieFilmsCell: UITableViewCell {

    @IBOutlet var postView: UIView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var purchaseButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func buildCell(movieData : Movie)  {
        self.purchaseButton.layer.cornerRadius = 5
        self.purchaseButton.tag = movieData.movieId!.intValue
        self.nameLabel.text = movieData.name
        self.nameLabel.sizeToFit()
        self.durationLabel.text = "Duration:" + movieData.duration!
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
