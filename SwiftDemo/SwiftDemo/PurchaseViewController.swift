//
//  PurchaseViewController.swift
//  SwiftDemo
//
//  Created by hongjian lin on 4/5/17.
//  Copyright © 2017 com.Tocaboca. All rights reserved.
//

import UIKit

class PurchaseViewController: UIViewController {
    
    @IBAction func backClick(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.loadRequest(NSURLRequest(url: NSURL(string: "https://www.zocdoc.com")! as URL) as URLRequest)
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
