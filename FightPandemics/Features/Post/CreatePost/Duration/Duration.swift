//
//  Duration.swift
//  FightPandemics
//
//  Created by ehsan sat on 5/17/20.
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

class Duration: UIView {
    private var topLine = UIView()
    private var questionLbl = UILabel()
    private var dayBtn = UIButton()
    private var weekBtn = UIButton()
    private var monthBtn = UIButton()
    private var foreverBtn = UIButton()
    private var closeBtn = UIButton()
    private var confirmBtn = UIButton()
    func setUp() {
        setUpUpper()
        setUpButtons()
        setUpLower()
        setUpConstraints()
    }

    func setUpUpper() {
        topLine.backgroundColor = UIColor(hexString: "#F3F4FE")
        topLine.frame.size.width = 116
        topLine.frame.size.height = 4
        topLine.clipsToBounds = true
        topLine.layer.masksToBounds = true
        topLine.layer.cornerRadius = topLine.frame.size.height / 2
        addSubview(topLine)
        questionLbl.text = "VisibilityTitle".localized
        questionLbl.font = Fonts.poppinsBold.customFont(size: 16)
        questionLbl.textAlignment = .center
        questionLbl.numberOfLines = 0
        addSubview(questionLbl)
    }

    func setUpButtons() {
        dayBtn.setAttributedTitle(NSAttributedString(string: "VisibilityNeighborBtn".localized, attributes: [NSAttributedString.Key.font: Fonts.dmSansRegular.customFont(size: 15), NSAttributedString.Key.foregroundColor: UIColor.black]), for: .normal)
        dayBtn.setTitleColor(UIColor.white, for: .selected)
        dayBtn.frame.size.height = 45
        dayBtn.frame.size.width = UIScreen.main.bounds.width - 46
        dayBtn.backgroundColor = UIColor(hexString: "#F2F2F2")
        dayBtn.clipsToBounds = true
        dayBtn.layer.masksToBounds = true
        dayBtn.layer.cornerRadius = 4
        addSubview(dayBtn)
        weekBtn.setAttributedTitle(NSAttributedString(string: "VisibilityCityBtn".localized, attributes: [NSAttributedString.Key.font: Fonts.dmSansRegular.customFont(size: 15), NSAttributedString.Key.foregroundColor: UIColor.black]), for: .normal)
        weekBtn.setTitleColor(UIColor.white, for: .selected)
        weekBtn.frame.size.height = 45
        weekBtn.frame.size.width = UIScreen.main.bounds.width - 46
        weekBtn.backgroundColor = UIColor(hexString: "#F2F2F2")
        weekBtn.clipsToBounds = true
        weekBtn.layer.masksToBounds = true
        weekBtn.layer.cornerRadius = 4
        addSubview(weekBtn)
        monthBtn.setAttributedTitle(NSAttributedString(string: "VisibilityCountryBtn".localized, attributes: [NSAttributedString.Key.font: Fonts.dmSansRegular.customFont(size: 15), NSAttributedString.Key.foregroundColor: UIColor.black]), for: .normal)
        monthBtn.setTitleColor(UIColor.white, for: .selected)
        monthBtn.frame.size.height = 45
        monthBtn.frame.size.width = UIScreen.main.bounds.width - 46
        monthBtn.backgroundColor = UIColor(hexString: "#F2F2F2")
        monthBtn.clipsToBounds = true
        monthBtn.layer.masksToBounds = true
        monthBtn.layer.cornerRadius = 4
        addSubview(monthBtn)
        foreverBtn.setAttributedTitle(NSAttributedString(string: "VisibilityAnyoneBtn".localized, attributes: [NSAttributedString.Key.font: Fonts.dmSansRegular.customFont(size: 15), NSAttributedString.Key.foregroundColor: UIColor.black]), for: .normal)
        foreverBtn.setTitleColor(UIColor.white, for: .selected)
        foreverBtn.frame.size.height = 45
        foreverBtn.frame.size.width = UIScreen.main.bounds.width - 46
        foreverBtn.backgroundColor = UIColor(hexString: "#F2F2F2")
        foreverBtn.clipsToBounds = true
        foreverBtn.layer.masksToBounds = true
        foreverBtn.layer.cornerRadius = 4
        addSubview(foreverBtn)
    }

    func setUpLower () {
        closeBtn.setAttributedTitle(NSAttributedString(string: "CloseButton".localized, attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 15), NSAttributedString.Key.foregroundColor: UIColor(hexString: "#425AF2")]), for: .normal)
        closeBtn.frame.size.width = ((UIScreen.main.bounds.width - 63) / 2)
        closeBtn.frame.size.height = 45
        closeBtn.clipsToBounds = true
        closeBtn.backgroundColor = UIColor.clear
        closeBtn.layer.masksToBounds = true
        closeBtn.layer.cornerRadius = closeBtn.frame.size.height / 2
        closeBtn.layer.borderColor = UIColor(hexString: "#425AF2").cgColor
        closeBtn.layer.borderWidth = 1

        self.addSubview(closeBtn)
        confirmBtn.setAttributedTitle(NSAttributedString(string: "ConfirmButton".localized, attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 15), NSAttributedString.Key.foregroundColor: UIColor(hexString: "#425AF2")]), for: .normal)
        confirmBtn.frame.size.width = ((UIScreen.main.bounds.width - 63) / 2)
        confirmBtn.frame.size.height = 45
        confirmBtn.clipsToBounds = true
        confirmBtn.backgroundColor = UIColor.clear
        confirmBtn.layer.masksToBounds = true
        confirmBtn.layer.cornerRadius = confirmBtn.frame.size.height / 2
        confirmBtn.layer.borderColor = UIColor(hexString: "#425AF2").cgColor
        confirmBtn.layer.borderWidth = 1
        addSubview(confirmBtn)
    }

    func setUpConstraints() {
        setUpUpperConstraints()
        setUpButtonsConstraints()
        setUpLowerConstraints()
    }

    func setUpUpperConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        topLine.makeSubview(of: self)
            .width(116)
            .height(4)
            .top(to: \.topAnchor, constant: 12)
            .centerX(to: \.centerXAnchor, constant: 23)

        questionLbl.makeSubview(of: self)
            .centerX(to: \.centerXAnchor, constant: 23)
            .top(to: \.topAnchor, constant: 37)
            .width(294)
            .height(22)
    }

    func setUpButtonsConstraints() {
        dayBtn.makeSubview(of: self)
            .centerX(to: \.centerXAnchor, constant: 0)
            .top(to: \.topAnchor, constant: 86)
            .left(to: \.leftAnchor, constant: 23)
            .right(to: \.rightAnchor, constant: 23)
            .width(UIScreen.main.bounds.width - 46)
            .height(45)

        weekBtn.makeSubview(of: self)
            .centerX(to: \.centerXAnchor, constant: 0)
            .top(to: \.topAnchor, constant: 143)
            .left(to: \.leftAnchor, constant: 23)
            .right(to: \.rightAnchor, constant: 23)
            .width(UIScreen.main.bounds.width - 46)
            .height(45)

        monthBtn.makeSubview(of: self)
            .centerX(to: \.centerXAnchor, constant: 0)
            .top(to: \.topAnchor, constant: 200)
            .left(to: \.leftAnchor, constant: 23)
            .right(to: \.rightAnchor, constant: 23)
            .width(UIScreen.main.bounds.width - 46)
            .height(45)

        foreverBtn.makeSubview(of: self)
            .centerX(to: \.centerXAnchor, constant: 0)
            .top(to: \.topAnchor, constant: 257)
            .left(to: \.leftAnchor, constant: 23)
            .right(to: \.rightAnchor, constant: 23)
            .width(UIScreen.main.bounds.width - 46)
            .height(45)
    }

    func setUpLowerConstraints() {
        closeBtn.makeSubview(of: self)
            .width((UIScreen.main.bounds.width - 63) / 2)
            .height(45)
            .top(to: \.topAnchor, constant: 335)
            .left(to: \.leftAnchor, constant: 22)

        confirmBtn.makeSubview(of: self)
            .width((UIScreen.main.bounds.width - 63) / 2)
            .height(45)
            .top(to: \.topAnchor, constant: 335)
            .right(to: \.rightAnchor, constant: 22)
    }
}
