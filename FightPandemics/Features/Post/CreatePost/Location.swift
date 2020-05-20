//
//  Location.swift
//  FightPandemics
//
//  Created by ehsan sat on 5/20/20.
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

class Location: UIView {
    private var locationLbl = UILabel()
    private var plusBtn = UIButton()
    private var topLine = UIView()
    private var muliplyerW = CGFloat()
    private var muliplyerH = CGFloat()
    func setUp() {
        muliplyerW = (UIScreen.main.bounds.width / 375)
        muliplyerH = (UIScreen.main.bounds.height / 812)
        topLine.backgroundColor = UIColor(hexString: "#F3F4FE")
        topLine.frame.size = CGSize(width: 116 * muliplyerW, height: 4 * muliplyerH)
        topLine.clipsToBounds = true
        topLine.layer.masksToBounds = true
        topLine.layer.cornerRadius = topLine.frame.size.height / 2
        self.addSubview(topLine)
        locationLbl.attributedText = NSAttributedString(string: "LocationLbl".localized, attributes: [NSAttributedString.Key.font: Fonts.poppinsBold.customFont(size: 16 * muliplyerW), NSAttributedString.Key.foregroundColor: UIColor(hexString: "#282828")])
        locationLbl.textAlignment = .left
        self.addSubview(locationLbl)
        plusBtn.setImage(UIImage(named: "plus"), for: .normal)
        plusBtn.setImage(UIImage(named: "minus"), for: .selected)
        plusBtn.frame.size = CGSize(width: 24 * muliplyerW, height: 24 * muliplyerH)
        self.addSubview(plusBtn)
        setUpConstraints()
    }
    func setUpConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        topLine.makeSubview(of: self)
            .width(116 * muliplyerW)
            .height(4 * muliplyerH)
            .top(to: \.topAnchor, constant: 12 * muliplyerW)
            .centerX(to: \.centerXAnchor, constant: 0)

        locationLbl.makeSubview(of: self)
            .width(118 * muliplyerW)
            .height(28 * muliplyerH)
            .left(to: \.leftAnchor, constant: 28 * muliplyerW)
            .top(to: \.topAnchor, constant: 44 * muliplyerH)
            .right(to: \.rightAnchor, constant: -((UIScreen.main.bounds.width - (186 * muliplyerW)) * muliplyerW))

        plusBtn.makeSubview(of: self)
            .width(24 * muliplyerW)
            .height(24 * muliplyerH)
            .right(to: \.rightAnchor, constant: -(25 * muliplyerW))
            .top(to: \.topAnchor, constant: 46 * muliplyerH)
            .left(to: \.leftAnchor, constant: ((UIScreen.main.bounds.width - (80 * muliplyerW)) * muliplyerW))
    }
}


