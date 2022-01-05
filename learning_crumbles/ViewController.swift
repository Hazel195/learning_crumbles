//
//  ViewController.swift
//  learning_crumbles
//
//  Created by Hazel Kim on 5/1/22.
//  Copyright © 2022 Hazel Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadYoutube(videoID: "WXr82D00jlM")
    }
    
    func loadYoutube(videoID:String) {
        // create a custom youtubeURL with the video ID
        guard
            let youtubeURL = NSURL(string: "https://www.youtube.com/embed/\(videoID)")
            else { return }
        // load your web request
        webView.loadRequest( NSURLRequest(url: youtubeURL as URL) as URLRequest )
    }

}

