//
//  Post.swift
//  Sample App
//
//  Created by Michele Gargiulo on 03/07/2019.
//  Copyright © 2019 Michele Gargiulo. All rights reserved.
//

import Foundation

public class Post {
    
    static let emptyTitle = "Empty Title"
    static let emptyDescription = "Empty Description"
    static let emptyTag = "#emptytag"
    static let emptySK = "emptySK"
    
    var Title: String = emptyTitle
    var Description: String = emptyDescription
    var Tags: [String] = [emptyTag, emptyTag, emptyTag]
    var SearchKeys: [String] = [emptySK, emptySK, emptySK]
    var Votes: Int = 0
    var UserVote: EnumVote = .Unvoted
    var UID: String
    
    init(UID: String) {
        self.UID = UID
    }
    
}
