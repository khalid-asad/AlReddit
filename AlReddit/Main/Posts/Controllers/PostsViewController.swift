//
//  PostsViewController.swift
//  AlReddit
//
//  Created by Khalid Asad on 2019-02-24.
//  Copyright © 2019 Khalid Asad. All rights reserved.
//

import UIKit

final class PostsViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    private var model: PostsModel!
    
    private var didTapAction: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model = PostsModel()
        
        configureStackView()
    }
}

extension PostsViewController {
    
    private func configureStackView() {
        stackView.arrangedSubviews.forEach {
            stackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        
        guard let items = model.stackableItems else { return }
        items.forEach {
            switch $0 {
            case .posts:
                addPosts()
            }
        }
    }
    
    private func addPosts() {
        #warning("Add functionality for posts")
    }
}
