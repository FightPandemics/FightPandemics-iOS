//
//  Body-OfferReqCard.swift
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

class BodyOfferRequestCard: UIStackView {
    private var titleTextView = UITextView()
    private var contentTextView = UITextView()
    private var moreBtn = UIButton()

    init(tit: String, message: String) {
        super.init(frame: .zero)

        titleTextView.attributedText = NSAttributedString(string: tit,
                                                          attributes: [.font: Fonts.poppinsBold.customFont(size: 22),
                                                                       .foregroundColor: UIColor.fightPandemicsNero()])

        contentTextView.attributedText = NSAttributedString(string: message,
                                                            attributes: [.font: Fonts.poppinsRegular.customFont(size: 14), .foregroundColor: UIColor.fightPandemicsNero()])

        moreBtn.setTitle("FeedPostViewMoreCTA".localized, for: .normal)
        moreBtn.setTitleColor(UIColor.fightPandemicsNeonBlue(), for: .normal)
        moreBtn.titleLabel?.font = Fonts.poppinsRegular.customFont(size: 14)

        // Vertical Stack Config
        axis = .vertical
        distribution = .fillProportionally
        translatesAutoresizingMaskIntoConstraints = false
        addArrangedSubview(titleTextView)
        addArrangedSubview(contentTextView)
        addArrangedSubview(moreBtn)
        makeConstraints()
    }

    required init(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func makeConstraints() {
        titleTextView.makeSubview(of: self)
            .top(to: \.topAnchor,
                 relation: .equal,
                 constant: 8,
                 priority: .required)
            .leading(to: \.leadingAnchor)
            .width(UIScreen.main.bounds.width - 40)
            .height(80)
        contentTextView.makeSubview(of: self)
            .top(to: \.bottomAnchor,
                 of: titleTextView,
                 relation: .equal,
                 constant: 30,
                 priority: .required)
            .leading(to: \.leadingAnchor)
            .width(UIScreen.main.bounds.width)
            .height(120)
        moreBtn.makeSubview(of: self)
            .right(to: \.rightAnchor, constant: 270)
            .bottom(to: \.bottomAnchor, constant: 10)
    }
}
