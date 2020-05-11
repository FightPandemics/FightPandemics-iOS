//
//  FeedPost.swift
//  FightPandemics
//
//  Created by ehsan sat on 5/11/20.
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

    private var typeLabel = UILabel()
    private var titleLabel = UILabel()
    private var bodyLabel = UILabel()
    private var moreButton = UIButton()

    func setUp (title: String, body: String, type: String) {
        // type label
        typeLabel.text = "  \(type) ."
        typeLabel.textAlignment = .center
        typeLabel.font = UIFont(name: "System", size: 11)
        typeLabel.sizeToFit()
        typeLabel.layoutIfNeeded()
        typeLabel.textColor = UIColor(hexString: "#425AF2")
        typeLabel.backgroundColor = UIColor.clear
        typeLabel.layer.borderColor = UIColor(hexString: "#425AF2").cgColor
        typeLabel.layer.borderWidth = 1
        typeLabel.layer.cornerRadius = typeLabel.frame.size.height / 2
        self.addSubview(typeLabel)
        // title label
        titleLabel.text = title
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel.numberOfLines = 0
        titleLabel.sizeToFit()
        titleLabel.layoutIfNeeded()
        titleLabel.textColor = UIColor(hexString: "#282828")
        titleLabel.backgroundColor = UIColor.clear
        self.addSubview(titleLabel)
        // body label
        bodyLabel.text = body
        bodyLabel.textAlignment = .left
        bodyLabel.font = UIFont(name: "System", size: 14)
        bodyLabel.numberOfLines = 0
        bodyLabel.sizeToFit()
        bodyLabel.layoutIfNeeded()
        bodyLabel.textColor = UIColor(hexString: "#282828")
        bodyLabel.backgroundColor = UIColor.clear
        self.addSubview(bodyLabel)
        // more button
        moreButton.setTitle(NSLocalizedString("FeedPostViewMoreCTA", comment: ""), for: .normal)
        moreButton.setTitleColor(UIColor(hexString: "#425AF2"), for: .normal)
        moreButton.titleLabel?.font = UIFont(name: "System", size: 16)
        moreButton.contentHorizontalAlignment = .left
        moreButton.backgroundColor = UIColor.clear
        self.addSubview(moreButton)
        makeConstraints()
    }

    private func makeConstraints () {
        self.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: typeLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: typeLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 74).isActive = true
        NSLayoutConstraint(item: typeLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 24).isActive = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: titleLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.width).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 24).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: typeLabel, attribute: .bottom, multiplier: 1, constant: 9).isActive = true
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: bodyLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.width - 47).isActive = true
        NSLayoutConstraint(item: bodyLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 24).isActive = true
        NSLayoutConstraint(item: bodyLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: bodyLabel, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 9).isActive = true
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: moreButton, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 24).isActive = true
        NSLayoutConstraint(item: moreButton, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 24).isActive = true
        NSLayoutConstraint(item: moreButton, attribute: .top, relatedBy: .equal, toItem: bodyLabel, attribute: .bottom, multiplier: 1, constant: 16).isActive = true
        NSLayoutConstraint(item: moreButton, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
    }
}
