//
//  Location.swift
//  FightPandemics
//
//  Created by ehsan sat on 5/21/20.
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
    private var locInfoView = UIView()
    func setUp() {
        multiplierW = (UIScreen.main.bounds.width / 375)
        multiplierH = (UIScreen.main.bounds.height / 812)
        topLine.backgroundColor = UIColor.fightPandemicsGhostWhite()
        topLine.frame.size = CGSize(width: 116 * multiplierW, height: 4 * multiplierH)
        topLine.clipsToBounds = true
        topLine.layer.masksToBounds = true
        topLine.layer.cornerRadius = topLine.frame.size.height / 2
        addSubview(topLine)
        locationLbl.attributedText = NSAttributedString(string: "LocationLbl".localized, attributes: [NSAttributedString.Key.font: Fonts.poppinsBold.customFont(size: 16 * multiplierW), NSAttributedString.Key.foregroundColor: UIColor.fightPandemicsNero()])
        locationLbl.textAlignment = .left
        addSubview(locationLbl)
        plusBtn.setImage(UIImage(named: "plus"), for: .normal)
        plusBtn.setImage(UIImage(named: "minus"), for: .selected)
        plusBtn.isUserInteractionEnabled = true
        plusBtn.clipsToBounds = true
        plusBtn.frame.size = CGSize(width: 24 * multiplierW, height: 24 * multiplierH)
        plusBtn.addTarget(self, action: #selector(plusBtnTapped), for: .touchUpInside)
        addSubview(plusBtn)
        setUpConstraints()
    }

    @objc func plusBtnTapped() {
        plusBtn.isSelected = !plusBtn.isSelected
        if plusBtn.isSelected {
            locInfoView.frame = CGRect(origin: CGPoint(x: 0, y: 72), size: CGSize(width: frame.size.width, height: frame.size.height - 72))
            addSubview(locInfoView)

            locInfoView.makeSubview(of: self)
                .width(UIScreen.main.bounds.width)
                .height(frame.size.height - 72)
                .left(to: \.leftAnchor, constant: 0)
                .right(to: \.rightAnchor, constant: 0)
                .top(to: \.topAnchor, constant: 72)
                .bottom(to: \.bottomAnchor, constant: 0)
        } else {
            locInfoView.removeFromSuperview()
        }
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

        plusBtn.makeSubview(of: self)
            .width(24 * multiplierW)
            .height(24 * multiplierH)
            .right(to: \.rightAnchor, constant: -(25 * multiplierW))
            .top(to: \.topAnchor, constant: 46 * multiplierH)
    }
}
