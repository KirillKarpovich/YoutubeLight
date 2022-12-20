//
//  Video.swift
//  YoutubeLight
//
//  Created by Kirill Karpovich on 17.12.22.
//

import Foundation

struct Video: Decodable {
    
//    var videoID = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var publishedAt = Date()
    
    enum CodingKeys: String, CodingKey {
       
        case snippet
        case thumbnails
        case high
        
        
//        case videoID
        case title
        case description
        case thumbnail = "url"
        case publishedAt
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.videoID = try container.decode(String.self, forKey: .videoID)
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        self.publishedAt = try snippetContainer.decode(Date.self, forKey: .publishedAt)
        
        let thumbnailsContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let highContainer = try thumbnailsContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
    }
    
    
}
