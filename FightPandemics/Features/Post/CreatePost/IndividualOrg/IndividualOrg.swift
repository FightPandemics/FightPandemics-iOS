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
        setUpUpper()
        setUpLower()
        makeConstraints()
    }
    func setUpUpper () {
       topLine.backgroundColor = UIColor(hexString: "#F3F4FE")
        topLine.frame.size.width = 116
        topLine.frame.size.height = 4
        topLine.clipsToBounds = true
        topLine.layer.masksToBounds = true
        topLine.layer.cornerRadius = 2
        self.addSubview(topLine)
        createLbl.text = "IndividualOrgTitle".localized
        createLbl.font = Fonts.poppinsBold.customFont(size: 16)
        createLbl.textAlignment = .center
        createLbl.frame.size.width = 111
        createLbl.frame.size.height = 22
        self.addSubview(createLbl)
        descriptiveLbl.text = "IndividualOrgDescriptiveText".localized
        descriptiveLbl.font = Fonts.dmSansRegular.customFont(size: 13)
        descriptiveLbl.textAlignment = .center
        descriptiveLbl.numberOfLines = 0
        self.addSubview(descriptiveLbl)
    }
    func setUpLower () {
        individualBtn.setAttributedTitle(NSAttributedString(string: "IndividualOrgIndividualButton".localized, attributes: [NSAttributedString.Key.font: Fonts.dmSansRegular.customFont(size: 12), NSAttributedString.Key.foregroundColor: UIColor.black]), for: .normal)
        individualBtn.frame.size.height = 45
        individualBtn.frame.size.width = UIScreen.main.bounds.width - 46
        individualBtn.backgroundColor = UIColor(hexString: "#F2F2F2")
        individualBtn.clipsToBounds = true
        individualBtn.layer.masksToBounds = true
        individualBtn.layer.cornerRadius = 4
        self.addSubview(individualBtn)
        organizationBtn.setAttributedTitle(NSAttributedString(string: "IndividualOrgOrganizationButton".localized, attributes: [NSAttributedString.Key.font: Fonts.dmSansRegular.customFont(size: 12), NSAttributedString.Key.foregroundColor: UIColor.black]), for: .normal)
        organizationBtn.frame.size.height = 45
        organizationBtn.frame.size.width = UIScreen.main.bounds.width - 46
        organizationBtn.backgroundColor = UIColor(hexString: "#F2F2F2")
        organizationBtn.clipsToBounds = true
        organizationBtn.layer.masksToBounds = true
        organizationBtn.layer.cornerRadius = 4
        self.addSubview(organizationBtn)
        closeBtn.setAttributedTitle(NSAttributedString(string: "IndividualOrgCloseButton".localized, attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 15), NSAttributedString.Key.foregroundColor: UIColor(hexString: "#425AF2")]), for: .normal)
        closeBtn.frame.size.width = ((UIScreen.main.bounds.width - 63) / 2)
        closeBtn.frame.size.height = 45
        closeBtn.clipsToBounds = true
        closeBtn.backgroundColor = UIColor.clear
        closeBtn.layer.masksToBounds = true
        closeBtn.layer.cornerRadius = closeBtn.frame.size.height / 2
        closeBtn.layer.borderColor = UIColor(hexString: "#425AF2").cgColor
        closeBtn.layer.borderWidth = 1
        self.addSubview(closeBtn)
        confirmBtn.setAttributedTitle(NSAttributedString(string: "IndividualOrgConfirmButton".localized, attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 15), NSAttributedString.Key.foregroundColor: UIColor(hexString: "#425AF2")]), for: .normal)
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
    func makeConstraints () {
        makeUpperConstraints()
        makeLowerConstraints()
    }
    func makeUpperConstraints () {
        self.translatesAutoresizingMaskIntoConstraints = false
        topLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: topLine, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: topLine, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 12).isActive = true
        NSLayoutConstraint(item: topLine, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 116).isActive = true
        NSLayoutConstraint(item: topLine, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 4).isActive = true
        createLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: createLbl, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: createLbl, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 37).isActive = true
        NSLayoutConstraint(item: createLbl, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 111).isActive = true
        NSLayoutConstraint(item: createLbl, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 22).isActive = true
        descriptiveLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: descriptiveLbl, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: descriptiveLbl, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 80).isActive = true
        NSLayoutConstraint(item: descriptiveLbl, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: descriptiveLbl, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: descriptiveLbl, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: (UIScreen.main.bounds.width - 46)).isActive = true
    }
    func makeLowerConstraints () {
        individualBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: individualBtn, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: individualBtn, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 137).isActive = true
        NSLayoutConstraint(item: individualBtn, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: individualBtn, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: individualBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: (UIScreen.main.bounds.width - 46)).isActive = true
        NSLayoutConstraint(item: individualBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 45).isActive = true
        organizationBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: organizationBtn, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: organizationBtn, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 194).isActive = true
        NSLayoutConstraint(item: organizationBtn, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: organizationBtn, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: organizationBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: (UIScreen.main.bounds.width - 46)).isActive = true
        NSLayoutConstraint(item: organizationBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 45).isActive = true
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: closeBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ((UIScreen.main.bounds.width - 63) / 2)).isActive = true
        NSLayoutConstraint(item: closeBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 45).isActive = true
        NSLayoutConstraint(item: closeBtn, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 272).isActive = true
        NSLayoutConstraint(item: closeBtn, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 22).isActive = true
        confirmBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: confirmBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ((UIScreen.main.bounds.width - 63) / 2)).isActive = true
        NSLayoutConstraint(item: confirmBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 45).isActive = true
        NSLayoutConstraint(item: confirmBtn, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 272).isActive = true
        NSLayoutConstraint(item: confirmBtn, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 22).isActive = true
    }
}
