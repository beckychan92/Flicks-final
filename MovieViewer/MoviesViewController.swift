//
//  MoviesViewController.swift
//  MovieViewer
//
//  Created by Becky Chan on 1/29/17.
//  Copyright © 2017 Becky Chan. All rights reserved.
//

import UIKit
import AFNetworking
//import PKHUD

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    var movies: [NSDictionary]?
    var endpoint: String!
    
    //UI Refresh Control
    var refreshControl = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        self.navigationItem.title = "Flick's Movies"
        
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.setBackgroundImage(UIImage(named: "film_layout"), for: .default)
            navigationBar.tintColor = UIColor(red: 1.0, green: 0.25, blue: 0.25, alpha: 0.8)
        }
        
        
        let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(endpoint!)?api_key=\(apiKey)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)            //URLRequest(url: url!)
            //
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task: URLSessionDataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            if let data = data {
                if let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                    print(dataDictionary)
                    
                    self.movies = dataDictionary["results"] as! [NSDictionary]
                    self.tableView.reloadData()
                }
            }
        }
        
        
        //Refresh
        tableView.refreshControl = self.refreshControl
        self.refreshControl.addTarget(self, action: "didRefreshList", for: .valueChanged)
        
        task.resume()
        // Do any additional setup after loading the view.
    }
    
    
    
    //refresh
    func didRefreshList(){
        self.refreshControl.endRefreshing()
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let movies = movies {
            return movies.count
        }else {
            return 0
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath as IndexPath) as! MovieCell
        
        let movie = movies![indexPath.row]
        
        let title = movie["title"] as? String
        let overview = movie["overview"] as? String
        
        cell.titleLabel.text = title
        cell.overviewLabel.text = overview
        
        //************************************************//
//        Customizing the cell selection style = none
//        cell.selectionStyle = .none

//        Customizing the cell selection style = yellow
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.yellow
        cell.selectedBackgroundView = backgroundView
        
//        trying to change the background color to an image
//        cell.accessoryView?.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "film_layout"))
        //************************************************//

        
        
        //************************************************//
//        let smallImageRequest = NSURLRequest(URL: NSURL(string:smallImageRequest)!)
//        let largeImageRequest = NSURLRequest(URL: NSURL(string:largeImageRequest)!)
//        
//        self.myImageView.setImageWithURLRequest(
//            smallImageRequest,
//            placeholderImage: nil,
//            success:{{ smallImageRequest;, smallImageResponse, smallImage) -> Void in
//                
//                }}
//        )
        //************************************************//
        
        
        let baseURL = "https://image.tmdb.org/t/p/w500"
        
        if let posterPath = movie["poster_path"] as? String{
            let posterURL = NSURL(string: baseURL + posterPath)
            cell.posterView.setImageWith(posterURL! as URL)
        }
        //************************************************//

        
        
        

        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)
        let movie = movies![indexPath!.row]
        
        let detailViewController = segue.destination as! DetailViewController
        detailViewController.movie = movie
        
    }
    


}
