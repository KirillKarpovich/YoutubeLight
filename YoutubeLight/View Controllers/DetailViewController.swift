//
//  DetailViewController.swift
//  YoutubeLight
//
//  Created by Kirill Karpovich on 20.12.22.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var webView: WKWebView!
    @IBOutlet var textView: UITextView!
    
    var video:Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //Clear the fields
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""

        // Check if there is a video
        guard video != nil else { return }
        
        //Create a embed URL
        let embedUrlString = Constants.YT_EMBED_URL + video!.videoId
        
        //Load it into the WebView
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        //Set the title
        titleLabel.text = video!.title
        
        //Set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.publishedAt)
       
        //Set the description
        textView.text = video!.description
    }
}
