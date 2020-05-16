//
//  Visibility.swift
//  FightPandemics
//
//  Created by ehsan sat on 5/16/20.
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

class Visibility: UIView {
    private var topLine = UIView()
    private var questionLbl = UILabel()
    private var neighborBtn = UIButton()
    private var cityBtn = UIButton()
    private var countryBtn = UIButton()
    private var anyoneBtn = UIButton()
    private var closeBtn = UIButton()
    private var confirmBtn = UIButton()
    private var firstVSV = UIStackView()
    private var firstHSV = UIStackView()
    private var finalVSV = UIStackView()
    func setUp () {
        setUpUpper()
        setUpButtons()
        setUpLower()
        setUpConstraints()
    }
    func setUpUpper () {
        topLine.backgroundColor = UIColor(hexString: "#F3F4FE")
        topLine.frame.size.width = 116
        topLine.frame.size.height = 4
        topLine.clipsToBounds = true
        topLine.layer.masksToBounds = true
        topLine.layer.cornerRadius = topLine.frame.size.height / 2
        self.addSubview(topLine)
        questionLbl.text = "OfferRequestTitle".localized
        questionLbl.font = Fonts.poppinsBold.customFont(size: 16)
        questionLbl.textAlignment = .center
        questionLbl.numberOfLines = 0
        self.addSubview(questionLbl)
    }
    func setUpButtons () {
        neighborBtn.setAttributedTitle(NSAttributedString(string: "OfferRequestOfferBtn".localized, attributes: [NSAttributedString.Key.font: Fonts.dmSansRegular.customFont(size: 12), NSAttributedString.Key.foregroundColor: UIColor.black]), for: .normal)
        neighborBtn.setTitleColor(UIColor.white, for: .selected)
        neighborBtn.frame.size.height = 45
        neighborBtn.frame.size.width = UIScreen.main.bounds.width - 46
        neighborBtn.backgroundColor = UIColor(hexString: "#F2F2F2")
        neighborBtn.clipsToBounds = true
        neighborBtn.layer.masksToBounds = true
        neighborBtn.layer.cornerRadius = 4
        self.addSubview(neighborBtn)
        cityBtn.setAttributedTitle(NSAttributedString(string: "OfferRequestRequestBtn".localized, attributes: [NSAttributedString.Key.font: Fonts.dmSansRegular.customFont(size: 12), NSAttributedString.Key.foregroundColor: UIColor.black]), for: .normal)
        cityBtn.setTitleColor(UIColor.white, for: .selected)
        cityBtn.frame.size.height = 45
        cityBtn.frame.size.width = UIScreen.main.bounds.width - 46
        cityBtn.backgroundColor = UIColor(hexString: "#F2F2F2")
        cityBtn.clipsToBounds = true
        cityBtn.layer.masksToBounds = true
        cityBtn.layer.cornerRadius = 4
        self.addSubview(cityBtn)
        countryBtn.setAttributedTitle(NSAttributedString(string: "OfferRequestRequestBtn".localized, attributes: [NSAttributedString.Key.font: Fonts.dmSansRegular.customFont(size: 12), NSAttributedString.Key.foregroundColor: UIColor.black]), for: .normal)
        countryBtn.setTitleColor(UIColor.white, for: .selected)
        countryBtn.frame.size.height = 45
        countryBtn.frame.size.width = UIScreen.main.bounds.width - 46
        countryBtn.backgroundColor = UIColor(hexString: "#F2F2F2")
        countryBtn.clipsToBounds = true
        countryBtn.layer.masksToBounds = true
        countryBtn.layer.cornerRadius = 4
        self.addSubview(countryBtn)
        anyoneBtn.setAttributedTitle(NSAttributedString(string: "OfferRequestRequestBtn".localized, attributes: [NSAttributedString.Key.font: Fonts.dmSansRegular.customFont(size: 12), NSAttributedString.Key.foregroundColor: UIColor.black]), for: .normal)
        anyoneBtn.setTitleColor(UIColor.white, for: .selected)
        anyoneBtn.frame.size.height = 45
        anyoneBtn.frame.size.width = UIScreen.main.bounds.width - 46
        anyoneBtn.backgroundColor = UIColor(hexString: "#F2F2F2")
        anyoneBtn.clipsToBounds = true
        anyoneBtn.layer.masksToBounds = true
        anyoneBtn.layer.cornerRadius = 4
        self.addSubview(anyoneBtn)
    }
    func setUpLower () {
        closeBtn.setAttributedTitle(NSAttributedString(string: "OfferRequestCloseBtn".localized, attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 15), NSAttributedString.Key.foregroundColor: UIColor(hexString: "#425AF2")]), for: .normal)
        closeBtn.frame.size.width = ((UIScreen.main.bounds.width - 63) / 2)
        closeBtn.frame.size.height = 45
        closeBtn.clipsToBounds = true
        closeBtn.backgroundColor = UIColor.clear
        closeBtn.layer.masksToBounds = true
        closeBtn.layer.cornerRadius = closeBtn.frame.size.height / 2
        closeBtn.layer.borderColor = UIColor(hexString: "#425AF2").cgColor
        closeBtn.layer.borderWidth = 1
        self.addSubview(closeBtn)
        confirmBtn.setAttributedTitle(NSAttributedString(string: "OfferRequestConfirmBtn".localized, attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 15), NSAttributedString.Key.foregroundColor: UIColor(hexString: "#425AF2")]), for: .normal)
        confirmBtn.frame.size.width = ((UIScreen.main.bounds.width - 63) / 2)
        confirmBtn.frame.size.height = 45
        confirmBtn.clipsToBounds = true
        confirmBtn.backgroundColor = UIColor.clear
        confirmBtn.layer.masksToBounds = true
        confirmBtn.layer.cornerRadius = confirmBtn.frame.size.height / 2
        confirmBtn.layer.borderColor = UIColor(hexString: "#425AF2").cgColor
        confirmBtn.layer.borderWidth = 1
        self.addSubview(confirmBtn)
    }
    func setUpConstraints () {
        setUpUpperConstraints()
        setUpButtonsConstraints()
        setUpLowerConstraints()
    }
    func setUpUpperConstraints () {
        self.translatesAutoresizingMaskIntoConstraints = false
        topLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: topLine, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: topLine, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 12).isActive = true
        NSLayoutConstraint(item: topLine, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 116).isActive = true
        NSLayoutConstraint(item: topLine, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 4).isActive = true
        questionLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: questionLbl, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: questionLbl, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 37).isActive = true
        NSLayoutConstraint(item: questionLbl, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 294).isActive = true
        NSLayoutConstraint(item: questionLbl, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 22).isActive = true
    }
    func setUpButtonsConstraints () {
        neighborBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: neighborBtn, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: neighborBtn, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 86).isActive = true
        NSLayoutConstraint(item: neighborBtn, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: neighborBtn, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: neighborBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: (UIScreen.main.bounds.width - 46)).isActive = true
        NSLayoutConstraint(item: neighborBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 45).isActive = true
        cityBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: cityBtn, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: cityBtn, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 143).isActive = true
        NSLayoutConstraint(item: cityBtn, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: cityBtn, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: cityBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: (UIScreen.main.bounds.width - 46)).isActive = true
        NSLayoutConstraint(item: cityBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 45).isActive = true
        countryBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: countryBtn, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: countryBtn, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 143).isActive = true
        NSLayoutConstraint(item: countryBtn, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: countryBtn, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: countryBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: (UIScreen.main.bounds.width - 46)).isActive = true
        NSLayoutConstraint(item: countryBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 45).isActive = true
        anyoneBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: anyoneBtn, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: anyoneBtn, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 143).isActive = true
        NSLayoutConstraint(item: anyoneBtn, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: anyoneBtn, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: anyoneBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: (UIScreen.main.bounds.width - 46)).isActive = true
        NSLayoutConstraint(item: anyoneBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 45).isActive = true
    }
    func setUpLowerConstraints () {
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: closeBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ((UIScreen.main.bounds.width - 63) / 2)).isActive = true
        NSLayoutConstraint(item: closeBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 45).isActive = true
        NSLayoutConstraint(item: closeBtn, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 221).isActive = true
        NSLayoutConstraint(item: closeBtn, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 22).isActive = true
        confirmBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: confirmBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ((UIScreen.main.bounds.width - 63) / 2)).isActive = true
        NSLayoutConstraint(item: confirmBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 45).isActive = true
        NSLayoutConstraint(item: confirmBtn, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 221).isActive = true
        NSLayoutConstraint(item: confirmBtn, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 22).isActive = true
    }
}


