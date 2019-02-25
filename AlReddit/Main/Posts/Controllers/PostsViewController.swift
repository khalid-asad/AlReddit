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
        let postsView = PostsView.create(title: "title", postImage: UIImage(named: "hanny-naibaho"), upvoteText: "100", downvoteText: "200", commentsText: "3", timeText: "4h", subredditText: "r/niceguys", goldText: "1", silverText: "2", bronzeText: "3")
        stackView.addArrangedSubview(UIView.createView(withSubview: postsView, edgeInsets: .sides))
        
        postsView.didTapAction = {
            #warning("Implement functionality to go to comments")
        }
        
        postsView.didTapImage = { (newImageView) in
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissFullscreenImage))
            newImageView.addGestureRecognizer(tap)
            self.view.addSubview(newImageView)
            self.navigationController?.isNavigationBarHidden = true
            self.tabBarController?.tabBar.isHidden = true
        }
    }
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }
}
