//
//  DetailViewController.swift
//  MovieViewer
//
//  Created by Becky Chan on 2/5/17.
//  Copyright © 2017 Becky Chan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    
    
    var movie: NSDictionary!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Youtube: 11:10
        let title = movie["title"] as? String
        titleLabel.text = title
        
        let overview = movie["overview"]
        overviewLabel.text = overview as? String
        
        let baseURL = "https://image.tmdb.org/t/p/w500"
        
        if let posterPath = movie["poster_path"] as? String{
            let posterURL = NSURL(string: baseURL + posterPath)
            posterImageView.setImageWith(posterURL! as URL)
        }
        
        print(movie)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any r esources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
