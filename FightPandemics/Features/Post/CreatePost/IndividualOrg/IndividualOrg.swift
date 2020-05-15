//
//  InidividualOrg.swift
//  FightPandemics
//
//  Created by ehsan sat on 5/15/20.
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

class IndividualOrg: UIView {
    private var topLine = UIView()
    private var createLbl = UILabel()
    private var descriptiveLbl = UILabel()
    private var individualBtn = UIButton()
    private var organizationBtn = UIButton()
    private var closeBtn = UIButton()
    private var confirmBtn = UIButton()
    func setUp () {
        topLine.backgroundColor = UIColor(hexString: "#F3F4FE")
        topLine.frame.size.width = 116
        topLine.frame.size.height = 4
        topLine.clipsToBounds = true
        topLine.layer.masksToBounds = true
        topLine.layer.cornerRadius = 2
        self.addSubview(topLine)
        createLbl.text = "Create a post"
        createLbl.font = Fonts.poppinsBold.customFont(size: 16)
        createLbl.textAlignment = .center
        self.addSubview(createLbl)
        descriptiveLbl.text = "Before you can create a post, are you posting on behalf of an organization?"
        descriptiveLbl.font = Fonts.dmSansRegular.customFont(size: 13)
        descriptiveLbl.textAlignment = .center
        descriptiveLbl.numberOfLines = 0
        self.addSubview(descriptiveLbl)
        individualBtn.setAttributedTitle(NSAttributedString(string: "Individual", attributes: [NSAttributedString.Key.font: Fonts.dmSansRegular.customFont(size: 12), NSAttributedString.Key.foregroundColor: UIColor.white]), for: .normal)
        individualBtn.frame.size.height = 45
        self.addSubview(individualBtn)

    }
    func makeConstraints () {
        self.translatesAutoresizingMaskIntoConstraints = false
        topLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: topLine, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: topLine, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 12).isActive = true
        NSLayoutConstraint(item: topLine, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 116).isActive = true
        NSLayoutConstraint(item: topLine, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .top, multiplier: 1, constant: 4).isActive = true
        createLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: createLbl, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: createLbl, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 37).isActive = true
        descriptiveLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: descriptiveLbl, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: descriptiveLbl, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 80).isActive = true
        NSLayoutConstraint(item: descriptiveLbl, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: descriptiveLbl, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 23).isActive = true
    }
}
