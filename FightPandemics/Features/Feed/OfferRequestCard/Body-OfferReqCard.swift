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
    var title = UILabel()
    var subTitle = UITextView()

    init(tit: String, message: String) {
        super.init(frame: .zero)

        title.frame = CGRect(x: 0, y: 400, width: 200, height: 200)
        title.attributedText = NSAttributedString(string: tit,
                                                  attributes: [NSAttributedString.Key.font: Fonts.poppinsBold.customFont(size: 22), NSAttributedString.Key.foregroundColor: UIColor.fightPandemicsNero()])
        title.widthAnchor.constraint(equalToConstant: title.frame.width).isActive = true
        title.heightAnchor.constraint(equalToConstant: 50.0).isActive = true

        subTitle.frame = CGRect(x: 0, y: 400, width: 200, height: 600)
        subTitle.attributedText = NSAttributedString(string: message,
                                                     attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 14), NSAttributedString.Key.foregroundColor: UIColor.fightPandemicsNero()])
        subTitle.widthAnchor.constraint(equalToConstant: subTitle.frame.width).isActive = true
        subTitle.heightAnchor.constraint(equalToConstant: 200).isActive = true

        axis = NSLayoutConstraint.Axis.vertical
        translatesAutoresizingMaskIntoConstraints = false
        addArrangedSubview(title)
        addArrangedSubview(subTitle)
    }

    required init(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
