//
//  Model.swift
//  YoutubeLight
//
//  Created by Kirill Karpovich on 17.12.22.
//

import Foundation

protocol ModelDelegate {
    
    func videosFetched(_ videos:[Video])
    
}

class Model {
    
    var delegate: ModelDelegate?
    
    func getVideos() {
        
        guard let url = URL(string: Constants.API_URL) else { return }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { data, response, error in
            
            if error != nil || data == nil {
                return
            }
            do {
                // Parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil{
                    
                    DispatchQueue.main.async {
                        self.delegate?.videosFetched(response.items!)
                    }
                }
                dump(response)
            }
            catch {
                print("Error response")
            }
            
        }
        dataTask.resume()
    }
}
