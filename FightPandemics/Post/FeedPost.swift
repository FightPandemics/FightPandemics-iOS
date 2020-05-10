//
//  FeedPost.swift
//  FightPandemics
//
//  Created by ehsan sat on 5/10/20.
//
//  Copyright (c) 2020 FightPandemics
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit

class FeedPost: UIView {
    var type: String?
    var title: String?
    var body: String?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    init(type: String, title: String, body: String) {
        self.type = type
        self.title = title
        self.body = body
        super.init(frame: CGRect())
        setUp()
    }
    func setUp () {
        // UI Components
        let label = UILabel()
        label.text = self.type
            label.textAlignment = .center
            label.font = UIFont(name: "System", size: 11)
            label.numberOfLines = 0
            label.sizeToFit()
            label.layoutIfNeeded()
        label.frame.size.height = 24
            label.textColor = UIColor(hexString: "#425AF2")
            label.backgroundColor = UIColor.clear
            label.layer.borderColor = UIColor(hexString: "#425AF2").cgColor
            label.layer.masksToBounds = true
            label.clipsToBounds = true
            label.layer.borderWidth = 1
        label.layer.cornerRadius = label.frame.size.height / 2
            self.addSubview(label)
        let titleLabel = UILabel()
        titleLabel.text = self.title
            titleLabel.textAlignment = .left
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
            titleLabel.numberOfLines = 0
            titleLabel.sizeToFit()
            titleLabel.layoutIfNeeded()
            titleLabel.textColor = UIColor(hexString: "#282828")
            titleLabel.backgroundColor = UIColor.clear
          self.addSubview(titleLabel)
        let bodyLabel = UILabel()
        bodyLabel.text = self.body
        bodyLabel.textAlignment = .left
        bodyLabel.font = UIFont(name: "System", size: 14)
        bodyLabel.numberOfLines = 0
        bodyLabel.sizeToFit()
        bodyLabel.layoutIfNeeded()
        bodyLabel.textColor = UIColor(hexString: "#282828")
        bodyLabel.backgroundColor = UIColor.clear
        self.addSubview(bodyLabel)
        let moreButton = UIButton()
        moreButton.titleLabel?.text = "View More"
        moreButton.titleLabel?.font = UIFont(name: "System", size: 16)
        moreButton.titleLabel?.textAlignment = .left
        moreButton.titleLabel?.textColor = UIColor(hexString: "#425AF2")
        moreButton.backgroundColor = UIColor.clear
        moreButton.layer.borderWidth = 1
        moreButton.frame.size.height = 22
        moreButton.frame.size.width = 100
        self.addSubview(moreButton)
        makeConstraints(label: label, titleLabel: titleLabel, bodyLabel: bodyLabel, moreButton: moreButton)
    }
    func makeConstraints (label: UILabel, titleLabel: UILabel, bodyLabel: UILabel, moreButton: UIButton) {
                // Constraints
                self.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: (UIScreen.main.bounds.width - 47)).isActive = true
                label.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 23).isActive = true
                NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 74).isActive = true
                NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 24).isActive = true
                titleLabel.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint(item: titleLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.width).isActive = true
                NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 24).isActive = true
                NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 23).isActive = true
                NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: label, attribute: .bottom, multiplier: 1, constant: 9).isActive = true
                bodyLabel.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint(item: bodyLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.width - 47).isActive = true
                NSLayoutConstraint(item: bodyLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 24).isActive = true
                NSLayoutConstraint(item: bodyLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 23).isActive = true
                NSLayoutConstraint(item: bodyLabel, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 9).isActive = true
                NSLayoutConstraint(item: bodyLabel, attribute: .bottom, relatedBy: .equal, toItem: moreButton, attribute: .top, multiplier: 1, constant: 16).isActive = true
                moreButton.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint(item: moreButton, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 24).isActive = true
                NSLayoutConstraint(item: moreButton, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 24).isActive = true
                NSLayoutConstraint(item: moreButton, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
    }
}
