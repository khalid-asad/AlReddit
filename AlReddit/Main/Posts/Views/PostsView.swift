//
//  PostsView.swift
//  AlReddit
//
//  Created by Khalid Asad on 2019-02-24.
//  Copyright © 2019 Khalid Asad. All rights reserved.
//

import Foundation
import UIKit

typealias PostInformation = (title: String?, postImage: UIImage?, upvoteText: String?, downvoteText: String?, commentsText: String?, timeText: String?, subredditText: String?, goldText: String?, silverText: String?, bronzeText: String?)

final class PostsView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var informationStackView: UIStackView!
    @IBOutlet weak var donationsStackView: UIStackView!
    @IBOutlet weak var upvoteImageView: UIImageView!
    @IBOutlet weak var upvoteLabel: UILabel!
    @IBOutlet weak var downvoteImageView: UIImageView!
    @IBOutlet weak var downvoteLabel: UILabel!
    @IBOutlet weak var commentsImageView: UIImageView!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var timeImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var moreImageView: UIImageView!
    @IBOutlet weak var subredditLabel: UILabel!
    @IBOutlet weak var goldImageView: UIImageView!
    @IBOutlet weak var goldLabel: UILabel!
    @IBOutlet weak var silverImageView: UIImageView!
    @IBOutlet weak var silverLabel: UILabel!
    @IBOutlet weak var bronzeImageView: UIImageView!
    @IBOutlet weak var bronzeLabel: UILabel!
    @IBOutlet weak var postImageHeight: NSLayoutConstraint!
    @IBOutlet weak var postImageWidth: NSLayoutConstraint!
    
    private var isExpanded: Bool = false
    
    var didTapAction: (() -> Void)?
    var didTapImage: ((UIView) -> Void)?
    
    private var upvoteImage = UIImage(named: "arrow-up")
    private var downvoteImage = UIImage(named: "arrow-down")
    private var commentsImage = UIImage(named: "message-square")
    private var timeImage = UIImage(named: "clock")
    private var moreImage = UIImage(named: "more-horizontal")
    private var awardImage = UIImage(named: "award")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        titleLabel.textColor = UIColor.black
        [upvoteLabel, downvoteLabel, commentsLabel, timeLabel, goldLabel, silverLabel, bronzeLabel].forEach() {
            $0?.font = UIFont(name: "HelveticaNeue", size: 12)
            $0?.textColor = UIColor.black
        }
        
        addBorder(color: .black, width: 3)
        setRoundedCorners(radius: 12)
    }
}

// MARK: - Internal Methods
extension PostsView {
    
    static func create(postInformation: PostInformation) -> PostsView {
        let view: PostsView = .fromNib()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.configure(postInformation: postInformation)
        return view
    }
}

// MARK: - Private Methods
extension PostsView {
    
    private func configure(postInformation: PostInformation) {
        titleLabel.configure(text: postInformation.title)
        postImageView.setAutoScaledImage(inputImage: postInformation.postImage, widthConstraint: postImageWidth, heightConstraint: postImageHeight)
        upvoteImageView.configure(image: upvoteImage)
        upvoteLabel.configure(text: postInformation.upvoteText)
        downvoteImageView.configure(image: downvoteImage)
        downvoteLabel.configure(text: postInformation.downvoteText)
        commentsImageView.configure(image: commentsImage)
        commentsLabel.configure(text: postInformation.commentsText)
        timeImageView.configure(image: timeImage)
        timeLabel.configure(text: postInformation.timeText)
        moreImageView.configure(image: moreImage)
        subredditLabel.configure(text: postInformation.subredditText)
        
        configureDonations(text: postInformation.goldText, label: goldLabel, imageView: goldImageView, image: awardImage, color: .yellow)
        configureDonations(text: postInformation.silverText, label: silverLabel, imageView: silverImageView, image: awardImage, color: .black)
        configureDonations(text: postInformation.bronzeText, label: bronzeLabel, imageView: bronzeImageView, image: awardImage, color: .brown)
    }
    
    private func configureDonations(text: String?, label: UILabel, imageView: UIImageView, image: UIImage?, color: UIColor) {
        if let text = text {
            imageView.configure(image: image)
            label.configure(text: text)
            imageView.setImageColor(color: color)
        }
    }
}

// MARK: - IBActions
extension PostsView {
    
    @IBAction func didTapPostsView(gesture: UITapGestureRecognizer) {
        didTapAction?()
    }
    
    @IBAction func didTapImage(_ sender: UITapGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        let newImageView = UIImageView(image: imageView.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        didTapImage?(newImageView)
    }
    

}
