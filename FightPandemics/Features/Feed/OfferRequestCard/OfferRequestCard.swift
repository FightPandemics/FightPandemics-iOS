//
//  OfferRequestCard.swift
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

class OfferRequestCard: UIStackView {

    var headerStack = HeaderOfferRequestCard(postedDate: "Posted 14hrs ago",
                                             offer: "Offers",
                                             supplyType: "Medical Supplies")

    var subHeaderStack = SubHeaderOfferRequestCard(initials: "AM",
                                                   name: "Ana Muller",
                                                   location: "Berlin, Germany")

    var bodyStack = BodyOfferRequestCard(tit: "I have 100 face Masks to give away",
                                         message: "I have a small store and I would like to give away 100 mask but I don’t know where, please contact me if you need them. I have a small store and I would like to give away 100 mask but I don’t know where, please contact me if you need them. please contact m ...")

    var footerStack = FooterOfferRequestCard(numOfLikes: 4,
                                             numOfComments: 7)

    override init(frame _: CGRect) {
        super.init(frame: .zero)
    }

    init() {
        super.init(frame: .zero)

        headerStack.translatesAutoresizingMaskIntoConstraints = false
        subHeaderStack.translatesAutoresizingMaskIntoConstraints = false
        bodyStack.translatesAutoresizingMaskIntoConstraints = false
        footerStack.translatesAutoresizingMaskIntoConstraints = false

        // Offer Request Card Constraints
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        distribution = .fillProportionally
        spacing = 10
        addArrangedSubview(headerStack)
        addArrangedSubview(subHeaderStack)
        addArrangedSubview(bodyStack)
        addArrangedSubview(footerStack)

        // Footer to Card Constraints
        footerStack.makeSubview(of: self)
            .right(to: \.rightAnchor,
                   constant: -160)
    }

    required init(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
