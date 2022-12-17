//
//  Model.swift
//  YoutubeLight
//
//  Created by Kirill Karpovich on 17.12.22.
//

import Foundation


class Model {
    
    func getVideos() {
        
        guard let url = URL(string: Constants.API_URL) else { return }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { data, response, error in
            
            if error != nil || data == nil {
                return
            }
            
            
            
        }
        dataTask.resume()
    }
}
