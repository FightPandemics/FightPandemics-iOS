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
    private var multiplierW = CGFloat()
    private var multiplierH = CGFloat()
    func setUp() {
        multiplierW = (UIScreen.main.bounds.width / 375)
        multiplierH = (UIScreen.main.bounds.height / 812)
        topLine.backgroundColor = UIColor(hexString: "#F3F4FE")
        topLine.frame.size = CGSize(width: 116 * multiplierW, height: 4 * multiplierH)
        topLine.clipsToBounds = true
        topLine.layer.masksToBounds = true
        topLine.layer.cornerRadius = topLine.frame.size.height / 2
        addSubview(topLine)
        locationLbl.attributedText = NSAttributedString(string: "LocationLbl".localized, attributes: [NSAttributedString.Key.font: Fonts.poppinsBold.customFont(size: 16 * multiplierW), NSAttributedString.Key.foregroundColor: UIColor(hexString: "#282828")])
        locationLbl.textAlignment = .left
        addSubview(locationLbl)
        plusBtn.setImage(UIImage(named: "plus"), for: .normal)
        plusBtn.setImage(UIImage(named: "minus"), for: .selected)
        plusBtn.frame.size = CGSize(width: 24 * multiplierW, height: 24 * multiplierH)
        addSubview(plusBtn)
        setUpConstraints()
    }

    func setUpConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        topLine.makeSubview(of: self)
            .width(116 * multiplierW)
            .height(4 * multiplierH)
            .top(to: \.topAnchor, constant: 12 * multiplierW)
            .centerX(to: \.centerXAnchor, constant: 0)

        locationLbl.makeSubview(of: self)
            .width(118 * multiplierW)
            .height(28 * multiplierH)
            .left(to: \.leftAnchor, constant: 28 * multiplierW)
            .top(to: \.topAnchor, constant: 44 * multiplierH)
            .right(to: \.rightAnchor, constant: -((UIScreen.main.bounds.width - 146) * multiplierW))

        plusBtn.makeSubview(of: self)
            .width(24 * multiplierW)
            .height(24 * multiplierH)
            .right(to: \.rightAnchor, constant: -(25 * multiplierW))
            .top(to: \.topAnchor, constant: 46 * multiplierH)
            .left(to: \.leftAnchor, constant: (UIScreen.main.bounds.width - 70) * multiplierW)
    }
}
