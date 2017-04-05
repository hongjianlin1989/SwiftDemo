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
    let reuseIdentifier = "MovieCell"
    let movieService = MovieService.init() as MovieService
    var movieArray : Array<Movie> = Array.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        self.fetchListOfMoive()
    }
    
    
    func fetchListOfMoive() {
        let movieRequest = MovieRequest.init()
        self.movieService.getListOfMovieWithRequest(req: movieRequest) { (Array) in
            self.movieArray = Array
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: UItableViewDataSource and delegate
    
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
        
        if let c = cell as? MovieCell {
            
            c.buildCell(movieData: m)
        }
        
        return cell
    }

}

