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
    func setUp() {
        setUpUpper()
        setUpLower()
        makeConstraints()
    }

    func setUpUpper() {
        topLine.backgroundColor = UIColor.fightPandemicsGhostWhite()
        topLine.frame.size.width = 116
        topLine.frame.size.height = 4
        topLine.clipsToBounds = true
        topLine.layer.masksToBounds = true
        topLine.layer.cornerRadius = 2
        createLbl.text = "IndividualOrgTitle".localized
        createLbl.font = Fonts.poppinsBold.customFont(size: 16)
        createLbl.textAlignment = .center
        createLbl.frame.size.width = 111
        createLbl.frame.size.height = 22
        descriptiveLbl.text = "IndividualOrgDescriptiveText".localized
        descriptiveLbl.font = Fonts.dmSansRegular.customFont(size: 13)
        descriptiveLbl.textAlignment = .center
        descriptiveLbl.numberOfLines = 0
    }

    func setUpLower() {
        individualBtn.setAttributedTitle(NSAttributedString(string: "IndividualOrgIndividualButton".localized, attributes: [NSAttributedString.Key.font: Fonts.dmSansRegular.customFont(size: 15), NSAttributedString.Key.foregroundColor: UIColor.black]), for: .normal)
        individualBtn.frame.size.height = 45
        individualBtn.frame.size.width = UIScreen.main.bounds.width - 46
        individualBtn.backgroundColor = UIColor.fightPandemicsWhiteSmoke()
        individualBtn.clipsToBounds = true
        individualBtn.layer.masksToBounds = true
        individualBtn.layer.cornerRadius = 4
        organizationBtn.setAttributedTitle(NSAttributedString(string: "IndividualOrgOrganizationButton".localized, attributes: [NSAttributedString.Key.font: Fonts.dmSansRegular.customFont(size: 15), NSAttributedString.Key.foregroundColor: UIColor.black]), for: .normal)
        organizationBtn.frame.size.height = 45
        organizationBtn.frame.size.width = UIScreen.main.bounds.width - 46
        organizationBtn.backgroundColor = UIColor.fightPandemicsWhiteSmoke()
        organizationBtn.clipsToBounds = true
        organizationBtn.layer.masksToBounds = true
        organizationBtn.layer.cornerRadius = 4
        closeBtn.setAttributedTitle(NSAttributedString(string: "CloseButton".localized, attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 15), NSAttributedString.Key.foregroundColor: UIColor(hexString: "#425AF2")]), for: .normal)
        closeBtn.frame.size.width = ((UIScreen.main.bounds.width - 63) / 2)
        closeBtn.frame.size.height = 45
        closeBtn.clipsToBounds = true
        closeBtn.backgroundColor = UIColor.clear
        closeBtn.layer.masksToBounds = true
        closeBtn.layer.cornerRadius = closeBtn.frame.size.height / 2
        closeBtn.layer.borderColor = UIColor.fightPandemicsNeonBlue().cgColor
        closeBtn.layer.borderWidth = 1
        confirmBtn.setAttributedTitle(NSAttributedString(string: "ConfirmButton".localized, attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 15), NSAttributedString.Key.foregroundColor: UIColor(hexString: "#425AF2")]), for: .normal)
        confirmBtn.frame.size.width = ((UIScreen.main.bounds.width - 63) / 2)
        confirmBtn.frame.size.height = 45
        confirmBtn.clipsToBounds = true
        confirmBtn.backgroundColor = UIColor.clear
        confirmBtn.layer.masksToBounds = true
        confirmBtn.layer.cornerRadius = confirmBtn.frame.size.height / 2
        confirmBtn.layer.borderColor = UIColor.fightPandemicsNeonBlue().cgColor
        confirmBtn.layer.borderWidth = 1
    }

    func makeConstraints() {
        topLine.makeSubview(of: self)
            .centerX(to: \.centerXAnchor, constant: 23)
            .top(to: \.topAnchor, constant: 12)
            .width(116)
            .height(4)
        createLbl.makeSubview(of: self)
            .centerX(to: \.centerXAnchor, constant: 23)
            .top(to: \.topAnchor, constant: 37)
            .width(111)
            .height(22)
        descriptiveLbl.makeSubview(of: self)
            .centerX(to: \.centerXAnchor)
            .top(to: \.topAnchor, constant: 80)
            .leading(to: \.leadingAnchor, constant: 23)
            .trailing(to: \.trailingAnchor, constant: 23)
            .width(UIScreen.main.bounds.width - 46)
        individualBtn.makeSubview(of: self)
            .centerX(to: \.centerXAnchor)
            .top(to: \.topAnchor, constant: 137)
            .leading(to: \.leadingAnchor, constant: 23)
            .trailing(to: \.trailingAnchor, constant: 23)
            .width(UIScreen.main.bounds.width - 46)
            .height(45)
        organizationBtn.makeSubview(of: self)
            .centerX(to: \.centerXAnchor)
            .top(to: \.topAnchor, constant: 194)
            .leading(to: \.leadingAnchor, constant: 23)
            .trailing(to: \.trailingAnchor, constant: 23)
            .width(UIScreen.main.bounds.width - 46)
            .height(45)
        closeBtn.makeSubview(of: self)
            .width((UIScreen.main.bounds.width - 63) / 2)
            .height(45)
            .top(to: \.topAnchor, constant: 272)
            .leading(to: \.leadingAnchor, constant: 22)
        confirmBtn.makeSubview(of: self)
            .width((UIScreen.main.bounds.width - 63) / 2)
            .height(45)
            .top(to: \.topAnchor, constant: 272)
            .trailing(to: \.trailingAnchor, constant: 22)
    }
}
