//
//  Footer-OfferReqCard.swift
//  FightPandemics
//
//  Created by Luciano Schillagi on 6/15/20.
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

class FooterOfferRequestCard: UIStackView {
    private var likeBtn = PostReactionButton(type: .like)
    private var commentsBtn = PostReactionButton(type: .comments)
    private var sendBtn = PostReactionButton(type: .send)

    var numberOfLikes = UILabel()
    var numberOfComments = UILabel()

    private var likeStack = UIStackView()
    private var commentStack = UIStackView()

    init(numOfLikes: Int, numOfComments: Int) {
        super.init(frame: .zero)

        likeBtn.translatesAutoresizingMaskIntoConstraints = false
        commentsBtn.translatesAutoresizingMaskIntoConstraints = false
        sendBtn.translatesAutoresizingMaskIntoConstraints = false
        numberOfLikes.translatesAutoresizingMaskIntoConstraints = false
        numberOfComments.translatesAutoresizingMaskIntoConstraints = false

        numberOfLikes.text = String(numOfLikes)
        numberOfComments.text = String(numOfComments)

        likeStack.axis = NSLayoutConstraint.Axis.horizontal
        likeStack.distribution = UIStackView.Distribution.fillProportionally
        //        likeStack.frame = CGRect(x: 0, y: 0, width: 800, height: 200)
        likeStack.translatesAutoresizingMaskIntoConstraints = false
        likeStack.addArrangedSubview(likeBtn)
        likeStack.addArrangedSubview(numberOfLikes)

        commentStack.axis = NSLayoutConstraint.Axis.horizontal
        commentStack.distribution = UIStackView.Distribution.fillProportionally
        //        commentStack.frame = CGRect(x: 0, y: 0, width: 80, height: 200)
        commentStack.translatesAutoresizingMaskIntoConstraints = false
        commentStack.addArrangedSubview(commentsBtn)
        commentStack.addArrangedSubview(numberOfComments)

        axis = NSLayoutConstraint.Axis.horizontal
        distribution = UIStackView.Distribution.fillProportionally
        spacing = 0
        translatesAutoresizingMaskIntoConstraints = false

        addArrangedSubview(likeStack)
        addArrangedSubview(commentStack)
        addArrangedSubview(sendBtn)

        //        makeSubview(of: self)
        //            .left(to: \.leftAnchor, constant: 0)
        //            .top(to: \.topAnchor, constant: 0)
        //            .right(to: \.rightAnchor, constant: -80)
        //            .bottom(to: \.bottomAnchor, constant: 0)
    }

    required init(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
