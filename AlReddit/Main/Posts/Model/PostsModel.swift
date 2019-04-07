//
//  PostsModel.swift
//  AlReddit
//
//  Created by Khalid Asad on 2019-02-24.
//  Copyright © 2019 Khalid Asad. All rights reserved.
//

import Foundation
import UIKit

final class PostsModel {
    
    // MARK: - ItemStackable
    enum StackableItem {
        case posts(postInformation: PostInformation)
    }
    
    var stackableItems: [PostsModel.StackableItem] = []
}

extension PostsModel {
    
    func fetchPosts(complete: @escaping (() -> Void)) {
        stackableItems.append(.posts(postInformation: PostInformation(title: "Who's the goodest boy?", postImage: UIImage(named: "hanny-naibaho"), upvoteText: "10330", downvoteText: "200", commentsText: "343", timeText: "4h", subredditText: "r/aww", goldText: "1", silverText: "2", bronzeText: "3")))
        complete()
    }
}
