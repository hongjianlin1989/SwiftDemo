//
//  DetailViewController.swift
//  SwiftDemo
//
//  Created by hongjian lin on 4/5/17.
//  Copyright © 2017 com.Tocaboca. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire
class DetailViewController: UIViewController {
    
    var moveData : Movie?
    
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var directorLabel: UILabel!
    @IBOutlet var actorField: UITextView!
    @IBOutlet var descriptionField: UITextView!
    
    
    
    @IBAction func BackButtonClick(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.text = moveData?.name
        self.nameLabel.sizeToFit()
        self.directorLabel.text = moveData?.director
        self.descriptionField.text = moveData?.movieDescription
        self.showActors()
        self.showPosterImage(ImageID: moveData!.movieId!.stringValue)
        // Do any additional setup after loading the view.
    }
    
    
    func showPosterImage(ImageID : String )  {
        let urlString = "http://placehold.it/130?text=" + moveData!.movieId!.stringValue
        Alamofire.request(urlString).responseImage { response in
            debugPrint(response)
            debugPrint(response.result)
            
            if let image = response.result.value {
                self.posterImage?.image = image
            }
        }
    }
    
    func showActors()  {
        var actorString = ""
        for case let actor as String in (moveData?.Actors)! {
            actorString = actorString + actor
        }
        self.actorField.text = actorString
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
