//
//  ViewController.swift
//  YoutubeLight
//
//  Created by Kirill Karpovich on 15.12.22.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.getVideos()
    }


}

