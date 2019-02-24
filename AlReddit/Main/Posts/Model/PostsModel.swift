//
//  PostsModel.swift
//  AlReddit
//
//  Created by Khalid Asad on 2019-02-24.
//  Copyright © 2019 Khalid Asad. All rights reserved.
//

import Foundation

struct PostsModel {
    
    // MARK: - ItemStackable
    enum StackableItem: CaseIterable {
        case posts
    }
    
    var stackableItems: [PostsModel.StackableItem]! {
        return StackableItem.allCases
    }
}
