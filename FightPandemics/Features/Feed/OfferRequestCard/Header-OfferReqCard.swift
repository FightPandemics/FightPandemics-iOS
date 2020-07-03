//
//  Header-OfferReqCard.swift
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

class HeaderOfferRequestCard: UIStackView {
    let feedOfferRequestTime = FeedOfferReqTime(offerReq: .offers, timeStamp: "Posted 14hrs Ago")
    let feedCategoryTag = FeedCatTag(categoryTagTxt: "Medical Supplies")

    init(postedDate _: String, reqOrOffer _: String, supplyType _: String) {
        super.init(frame: .zero)
        axis = .horizontal
        distribution = .fillProportionally
        translatesAutoresizingMaskIntoConstraints = false
        addArrangedSubview(feedOfferRequestTime)
        addArrangedSubview(feedCategoryTag)
        makeConstraints()
    }

    required init(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func makeConstraints() {
        feedOfferRequestTime.makeSubview(of: self)
            .width(160)
            .right(to: \.leftAnchor,
                   of: feedCategoryTag,
                   constant: -81)
    }
}
