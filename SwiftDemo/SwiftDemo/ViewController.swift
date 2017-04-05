//
//  ViewController.swift
//  SwiftDemo
//
//  Created by hongjian lin on 4/4/17.
//  Copyright © 2017 com.Tocaboca. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    let reuseIdentifier = "MovieFilmsCell"
    let movieService = MovieService.init() as MovieService
    var movieArray : Array<Movie> = Array.init()
    var selectedIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "MovieFilmsCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        //self.fetchListOfMoive()
        self.fetchRankListOfMoive()
    }
    
    func fetchRankListOfMoive() {
        let movieRequest = MovieRequest.init(startRankIndex: 1, numMovies: 10)
        self.movieService.getRankListOfMovieWithRequest(req: movieRequest) { (Array) in
            self.movieArray = Array
            self.fetchDetailListOfMoive()
        }
    }
    
    func fetchDetailListOfMoive() {
        var movieListId = [String]()
        for case let item in self.movieArray {
            movieListId.append((item.movieId?.stringValue)!)
        }
        let movieRequest = MovieRequest.init(movieIds: movieListId as NSArray)
        self.movieService.getDetailListOfMovieWithRequest(req: movieRequest) { (Array) in
            self.movieArray = Array
            self.tableView.reloadData()
        }
    }
    
    func fetchListOfMoive() {
        let movieRequest = MovieRequest.init()
        self.movieService.getListOfMovieWithRequest(req: movieRequest) { (Array) in
            self.movieArray = Array
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detail") {
            let detailVC = segue.destination as! DetailViewController
            detailVC.moveData = self.movieArray[selectedIndex]
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func purchasePressed(sender: UIButton!) {
        self.performSegue(withIdentifier: "purchase", sender: nil)
    }
    
    
    // MARK: UItableView DataSource and delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.movieArray.count
    }
    
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 150;
    }
    
    func tableView(_ tableView: UITableView,
                   estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 150;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        let m = self.movieArray[indexPath.row]
        if let c = cell as? MovieFilmsCell{
            c.buildCell(movieData: m)
            c.purchaseButton.addTarget(self, action: #selector(purchasePressed), for: .touchUpInside)
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        self.performSegue(withIdentifier: "detail", sender: nil)
    }
    
    
}

