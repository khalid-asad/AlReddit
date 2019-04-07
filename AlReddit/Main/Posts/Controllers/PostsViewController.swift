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
        
        DispatchQueue.main.async {
            self.configureStackView()
        }
    }
}

extension PostsViewController {
    
    private func configureStackView() {
        stackView.arrangedSubviews.forEach {
            stackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        
        model.fetchPosts {
            if !self.model.stackableItems.isEmpty {
                self.model.stackableItems.forEach {
                    switch $0 {
                    case .posts(let postInformation):
                        self.addPosts(postInformation: postInformation)
                    }
                }
            }
        }
    }
    
    private func addPosts(postInformation: PostInformation) {
        let postsView = PostsView.create(postInformation: postInformation)
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
