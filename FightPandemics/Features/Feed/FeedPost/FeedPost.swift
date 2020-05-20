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

    func setUp(title: String, body: String, type: String) {
        // type label
        typeLabel.text = "  \(type) ."
        typeLabel.textAlignment = .center
        typeLabel.font = UIFont(name: "System", size: 11)
        typeLabel.sizeToFit()
        typeLabel.layoutIfNeeded()
        typeLabel.textColor = UIColor.fightPandemicsNeonBlue()
        typeLabel.backgroundColor = UIColor.clear
        typeLabel.layer.borderColor = UIColor.fightPandemicsNeonBlue().cgColor
        typeLabel.layer.borderWidth = 1
        typeLabel.layer.cornerRadius = typeLabel.frame.size.height / 2
        // title label
        titleLabel.text = title
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel.numberOfLines = 0
        titleLabel.sizeToFit()
        titleLabel.layoutIfNeeded()
        titleLabel.textColor = UIColor.fightPandemicsNero()
        titleLabel.backgroundColor = UIColor.clear
        // body label
        bodyLabel.text = body
        bodyLabel.textAlignment = .left
        bodyLabel.font = UIFont(name: "System", size: 14)
        bodyLabel.numberOfLines = 0
        bodyLabel.sizeToFit()
        bodyLabel.layoutIfNeeded()
        bodyLabel.textColor = UIColor.fightPandemicsNero()
        bodyLabel.backgroundColor = UIColor.clear
        // more button
        moreButton.setTitle("FeedPostViewMoreCTA".localized, for: .normal)
        moreButton.setTitleColor(UIColor.fightPandemicsNeonBlue(), for: .normal)
        moreButton.titleLabel?.font = UIFont(name: "System", size: 16)
        moreButton.contentHorizontalAlignment = .left
        moreButton.backgroundColor = UIColor.clear
        makeConstraints()
    }

    private func makeConstraints() {
        typeLabel.makeSubview(of: self)
            .leading(to: \.leadingAnchor, constant: 23)
            .top(to: \.topAnchor, constant: 74)
            .height(24)
        titleLabel.makeSubview(of: self)
            .width(UIScreen.main.bounds.width)
            .leading(to: \.leadingAnchor, constant: 24)
            .trailing(to: \.trailingAnchor, constant: 23)
            .top(to: \.topAnchor, constant: 9)
        bodyLabel.makeSubview(of: self)
            .width(UIScreen.main.bounds.width - 47)
            .leading(to: \.leadingAnchor, constant: 24)
            .trailing(to: \.trailingAnchor, constant: 23)
            .top(to: \.topAnchor, of: titleLabel, constant: 9)
        moreButton.makeSubview(of: self)
            .leading(to: \.leadingAnchor, constant: 24)
            .trailing(to: \.trailingAnchor, constant: 24)
            .top(to: \.topAnchor, of: bodyLabel, constant: 16)
            .bottom(to: \.bottomAnchor)
    }
}
