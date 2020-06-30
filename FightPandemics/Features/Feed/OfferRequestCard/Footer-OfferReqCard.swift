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

    // Like
    private var likeStack = UIStackView()
    private var likeBtn = PostReactionButton(type: .like)
    private var numberOfLikes = UILabel()
    // Comment
    private var commentStack = UIStackView()
    private var commentsBtn = PostReactionButton(type: .comments)
    private var numberOfComments = UILabel()
    // Send
    private var sendBtn = PostReactionButton(type: .send)

    init(numOfLikes: Int, numOfComments: Int) {
        super.init(frame: .zero)

        translatesAutoresizingMaskIntoConstraints = false
        likeStack.translatesAutoresizingMaskIntoConstraints = false
        likeBtn.translatesAutoresizingMaskIntoConstraints = false
        numberOfLikes.translatesAutoresizingMaskIntoConstraints = false
        commentStack.translatesAutoresizingMaskIntoConstraints = false
        commentsBtn.translatesAutoresizingMaskIntoConstraints = false
        numberOfComments.translatesAutoresizingMaskIntoConstraints = false
        sendBtn.translatesAutoresizingMaskIntoConstraints = false

        // Pass the number of likes and comments
        numberOfLikes.text = String(numOfLikes)
        numberOfComments.text = String(numOfComments)

        // Like Stack Config
        likeStack.axis = .horizontal
        likeStack.distribution = .fillProportionally

        // Add arranged subviews to Like Stack
        likeStack.addArrangedSubview(likeBtn)
        likeStack.addArrangedSubview(numberOfLikes)

        // Comment Stack Config
        commentStack.axis = .horizontal
        commentStack.distribution = .fillProportionally

        // Add arranged subviews to Comment Stack
        commentStack.addArrangedSubview(commentsBtn)
        commentStack.addArrangedSubview(numberOfComments)

        // Footer Stack Config
        axis = .horizontal
        distribution = .fillProportionally

        // Add arranged subviews to Footer Stack View
        addArrangedSubview(likeStack)
        addArrangedSubview(commentStack)
        addArrangedSubview(sendBtn)
    }

    required init(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
