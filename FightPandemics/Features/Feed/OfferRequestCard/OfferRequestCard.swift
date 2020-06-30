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
    override init(frame _: CGRect) {
        super.init(frame: .zero)
    }

    required init(headerData: HeaderOfferRequestCard,
                  subHeaderData: SubHeaderOfferRequestCard,
                  bodyData: BodyOfferRequestCard,
                  footerData: FooterOfferRequestCard) {
        super.init(frame: .zero)

        headerData.translatesAutoresizingMaskIntoConstraints = false
        subHeaderData.translatesAutoresizingMaskIntoConstraints = false
        bodyData.translatesAutoresizingMaskIntoConstraints = false
        footerData.translatesAutoresizingMaskIntoConstraints = false

        // Offer Request Card Constraints
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        distribution = .fillProportionally
        spacing = 10
        addArrangedSubview(headerData)
        addArrangedSubview(subHeaderData)
        addArrangedSubview(bodyData)
        addArrangedSubview(footerData)

        // Footer to Card Constraints
        footerData.makeSubview(of: self)
            .right(to: \.rightAnchor,
                   constant: -160)
    }

    required init(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
