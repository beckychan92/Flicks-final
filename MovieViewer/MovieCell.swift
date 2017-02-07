//
//  MovieCell.swift
//  MovieViewer
//
//  Created by Becky Chan on 1/30/17.
//  Copyright © 2017 Becky Chan. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    

    
    
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var overviewLabel: UILabel!
    
    @IBOutlet weak var posterView: UIImageView!
//    var movie: NSDictionary = [:]
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        let title = movie["title"] as? String
//        let overview = movie["overview"] as? String
//        titleLabel.text = title
//        overviewLabel.text = overview
//        
//        
//        let baseURL = "https://image.tmdb.org/t/p/w500"
//        
//        if let posterPath = movie["poster_path"] as? String{
//            let posterURL = NSURL(string: baseURL + posterPath)
//            posterView.setImageWith(posterURL as! URL)
//        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
