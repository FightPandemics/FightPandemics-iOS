//
//  CreatePostFooter.swift
//  FightPandemics
//
//  Created by ehsan sat on 5/13/20.
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

class CreatePostFooter: UIView {
    private var sepLine = UIView()
    private var questionLbl = UILabel()
    private var shareBtn = UIButton()
    private var durationBtn = UIButton()
    private var tagsLbl = UILabel()
    private var tagsBtn = UIButton()
    private var postBtn = UIButton()
    func setUp() {
        setUpUpper()
        setUpLower()
    }

    func setUpUpper() {
        // seperator line
        sepLine.backgroundColor = UIColor(hexString: "#D7D7D7")
        sepLine.frame.size.width = UIScreen.main.bounds.width
        sepLine.frame.size.height = 2
        addSubview(sepLine)
        // first question label
        questionLbl.text = "CreatePostAudienceQuestion".localized
        questionLbl.textAlignment = .left
        questionLbl.frame.size.width = UIScreen.main.bounds.width - 47
        questionLbl.frame.size.height = 22
        questionLbl.font = Fonts.poppinsBold.customFont(size: 16)
        questionLbl.numberOfLines = 0
        addSubview(questionLbl)
        // share button
        shareBtn.setTitle("CreatePostAudienceSelectionAnyone".localized, for: .normal)
        shareBtn.setImage(#imageLiteral(resourceName: "chevron-down"), for: .normal)
        shareBtn.titleLabel?.font = Fonts.dmSansRegular.customFont(size: 12)
        shareBtn.clipsToBounds = true
        shareBtn.backgroundColor = UIColor(hexString: "#F3F4FE")
        shareBtn.layer.masksToBounds = true
        shareBtn.frame.size.width = 140
        shareBtn.frame.size.height = 29
        shareBtn.layer.borderWidth = 0
        shareBtn.layer.cornerRadius = 4
        shareBtn.semanticContentAttribute = .forceRightToLeft
        shareBtn.setTitleColor(UIColor(hexString: "#425AF2"), for: .normal)
        addSubview(shareBtn)
        // duration button
        durationBtn.setTitle("CreatePostAudienceDuration".localized, for: .normal)
        durationBtn.setImage(#imageLiteral(resourceName: "chevron-down"), for: .normal)
        durationBtn.titleLabel?.font = Fonts.dmSansRegular.customFont(size: 12)
        durationBtn.clipsToBounds = true
        durationBtn.backgroundColor = UIColor(hexString: "#F3F4FE")
        durationBtn.layer.masksToBounds = true
        durationBtn.frame.size.width = 128
        durationBtn.frame.size.height = 29
        durationBtn.layer.borderWidth = 0
        durationBtn.layer.cornerRadius = 4
        durationBtn.sizeToFit()
        durationBtn.layoutIfNeeded()
        durationBtn.semanticContentAttribute = .forceRightToLeft
        durationBtn.setTitleColor(UIColor(hexString: "#425AF2"), for: .normal)
        addSubview(durationBtn)
        setUpUpperConstraints()
    }

    func setUpLower() {
        // tags label
        tagsLbl.text = "CreatePostAddTagsCTA".localized
        tagsLbl.textAlignment = .left
        tagsLbl.frame.size.width = UIScreen.main.bounds.width - 47
        tagsLbl.frame.size.height = 22
        tagsLbl.font = Fonts.poppinsBold.customFont(size: 16)
        tagsLbl.numberOfLines = 0
        addSubview(tagsLbl)
        // tags button
        tagsBtn.setTitle("CreatePostTagPlaceholder".localized, for: .normal)
        tagsBtn.setImage(#imageLiteral(resourceName: "tag"), for: .normal)
        tagsBtn.titleLabel?.font = Fonts.dmSansRegular.customFont(size: 12)
        tagsBtn.clipsToBounds = true
        tagsBtn.backgroundColor = UIColor(hexString: "#F2F2F2")
        tagsBtn.layer.masksToBounds = true
        tagsBtn.frame.size.width = 90
        tagsBtn.frame.size.height = 29
        tagsBtn.layer.borderWidth = 0
        tagsBtn.layer.cornerRadius = 4
        tagsBtn.sizeToFit()
        tagsBtn.layoutIfNeeded()
        tagsBtn.semanticContentAttribute = .forceLeftToRight
        tagsBtn.setTitleColor(UIColor.black, for: .normal)
        addSubview(tagsBtn)
        //  post button
        postBtn.setTitle("CreatePostCTAButtonCTA".localized, for: .normal)
        postBtn.setTitleColor(UIColor.white, for: .normal)
        postBtn.titleLabel?.font = Fonts.poppinsBold.customFont(size: 18)
        postBtn.clipsToBounds = true
        postBtn.backgroundColor = UIColor(hexString: "#425AF2")
        postBtn.layer.masksToBounds = true
        postBtn.frame.size.width = UIScreen.main.bounds.width - 47
        postBtn.frame.size.height = 54
        postBtn.layer.borderWidth = 0
        postBtn.layer.cornerRadius = postBtn.frame.size.height / 2
        postBtn.sizeToFit()
        postBtn.layoutIfNeeded()
        addSubview(postBtn)
        setUpLowerConstraints()
    }

    func setUpUpperConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        sepLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: sepLine, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.width).isActive = true
        NSLayoutConstraint(item: sepLine, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 1).isActive = true
        NSLayoutConstraint(item: sepLine, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: sepLine, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0).isActive = true
        questionLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: questionLbl, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.width - 47).isActive = true
        NSLayoutConstraint(item: questionLbl, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 22).isActive = true
        NSLayoutConstraint(item: questionLbl, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: questionLbl, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 24).isActive = true
        NSLayoutConstraint(item: questionLbl, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 24).isActive = true
        shareBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: shareBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 140).isActive = true
        NSLayoutConstraint(item: shareBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 29).isActive = true
        NSLayoutConstraint(item: shareBtn, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: shareBtn, attribute: .right, relatedBy: .equal, toItem: durationBtn, attribute: .left, multiplier: 1, constant: 8).isActive = true
        NSLayoutConstraint(item: shareBtn, attribute: .top, relatedBy: .equal, toItem: questionLbl, attribute: .bottom, multiplier: 1, constant: 16).isActive = true
        durationBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: durationBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 128).isActive = true
        NSLayoutConstraint(item: durationBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 29).isActive = true
        NSLayoutConstraint(item: durationBtn, attribute: .left, relatedBy: .equal, toItem: shareBtn, attribute: .right, multiplier: 1, constant: 8).isActive = true
        NSLayoutConstraint(item: durationBtn, attribute: .top, relatedBy: .equal, toItem: questionLbl, attribute: .bottom, multiplier: 1, constant: 16).isActive = true
    }

    func setUpLowerConstraints() {
        tagsLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: tagsLbl, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.width - 47).isActive = true
        NSLayoutConstraint(item: tagsLbl, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 22).isActive = true
        NSLayoutConstraint(item: tagsLbl, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: tagsLbl, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 24).isActive = true
        NSLayoutConstraint(item: tagsLbl, attribute: .top, relatedBy: .equal, toItem: shareBtn, attribute: .bottom, multiplier: 1, constant: 24).isActive = true
        tagsBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: tagsBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 98).isActive = true
        NSLayoutConstraint(item: tagsBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 29).isActive = true
        NSLayoutConstraint(item: tagsBtn, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: tagsBtn, attribute: .top, relatedBy: .equal, toItem: tagsLbl, attribute: .bottom, multiplier: 1, constant: 16).isActive = true
        postBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: postBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.width - 47).isActive = true
        NSLayoutConstraint(item: postBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 54).isActive = true
        NSLayoutConstraint(item: postBtn, attribute: .top, relatedBy: .equal, toItem: tagsBtn, attribute: .bottom, multiplier: 1, constant: 24).isActive = true
        NSLayoutConstraint(item: postBtn, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: postBtn, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 24).isActive = true
    }
}
