//
//  MovieListTableViewCell.swift
//  iOSMovieApp
//
//  Created by 박현우 on 2022/06/15.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {
    @IBOutlet weak var thumImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userRatingLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var actorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    public func update(_ data: Movie) {
        if data.image != "" {
            let url = URL(string: data.image)
            
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    self.thumImageView.image = UIImage(data: data!)
                    self.thumImageView.contentMode = .scaleAspectFill
                }
            }
        }
        
        titleLabel.text = data.title.removeHTMLTag()
        userRatingLabel.text = "평점: \(data.userRating)"
        directorLabel.text = "감독: \(data.director)"
        actorLabel.text = "배우: \(data.actor)"
    }
}
