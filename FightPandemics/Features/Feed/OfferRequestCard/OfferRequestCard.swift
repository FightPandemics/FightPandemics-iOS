//
//  Offer-Request-Card.swift
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
    // MARK: Properties 📥

    var header = HeaderOfferRequestCard(postedDate: "Posted 14hrs ago",
                                        offer: "Offers",
                                        supplyType: "Medical Supplies")

    var subHeader = SubHeaderOfferRequestCard(iniciales: "AM",
                                              nombre: "Ana Muller",
                                              ubicacion: "Berlin, Germany")

    var body = BodyOfferRequestCard(tit: "I have 100 face Masks to give away",
                                    message: "I have a small store and I would like to give away 100 mask but I don’t know where, please contact me if you need them. I have a small store and I would like to give away 100 mask but I don’t know where, please contact me if you need them. please contact m ...")
    var footer = FooterOfferRequestCard(numOfLikes: 4, numOfComments: 7)

    override init(frame _: CGRect) {
        super.init(frame: .zero)
    }

    init() {
        super.init(frame: .zero)

        header.translatesAutoresizingMaskIntoConstraints = false
        subHeader.translatesAutoresizingMaskIntoConstraints = false
        body.translatesAutoresizingMaskIntoConstraints = false
        footer.translatesAutoresizingMaskIntoConstraints = false

        axis = NSLayoutConstraint.Axis.vertical
        distribution = UIStackView.Distribution.fillProportionally
        translatesAutoresizingMaskIntoConstraints = false
        addArrangedSubview(header)
        addArrangedSubview(subHeader)
        addArrangedSubview(body)
        addArrangedSubview(footer)
    }

    required init(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UI Methods ⚙️

    func setUp() {
        header.translatesAutoresizingMaskIntoConstraints = false
        subHeader.translatesAutoresizingMaskIntoConstraints = false
        body.translatesAutoresizingMaskIntoConstraints = false
        footer.translatesAutoresizingMaskIntoConstraints = false

        // Configure the vertical stack
        axis = NSLayoutConstraint.Axis.vertical
        distribution = UIStackView.Distribution.fillProportionally
        alignment = .fill
        translatesAutoresizingMaskIntoConstraints = false
        addArrangedSubview(header)
        addArrangedSubview(subHeader)
        addArrangedSubview(body)
        addArrangedSubview(footer)
    }
}

