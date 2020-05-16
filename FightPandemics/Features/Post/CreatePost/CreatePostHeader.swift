//
//  CreatePostHeader.swift
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

class CreatePostHeader: UIView {
    var closeAction: (() -> Void)?

    private var createPostTitle = UILabel()
    private var cancelButton = UIButton()
    private var selectionBtn = UIButton()
    private var questionLbl = UILabel()
    private var sepLine = UIView()
    func setUp() {
        setUpUpper()
        setUpMiddle()
        setUpConstraints()
    }

    func setUpUpper() {
        //  header title
        createPostTitle.text = "CreatePostFormTitle".localized
        createPostTitle.textAlignment = .left
        createPostTitle.textColor = UIColor.black
        createPostTitle.frame.size.height = 27
        createPostTitle.frame.size.width = 154
        createPostTitle.font = Fonts.poppinsBold.customFont(size: 22)
        createPostTitle.numberOfLines = 0
        addSubview(createPostTitle)
        //  close button
        cancelButton.setImage(#imageLiteral(resourceName: "x"), for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        addSubview(cancelButton)
    }

    func setUpMiddle() {
        // question label
        questionLbl.text = "CreatePostFormSubtitle".localized
        questionLbl.textAlignment = .left
        questionLbl.font = Fonts.dmSansRegular.customFont(size: 13)
        questionLbl.frame.size.height = 22
        questionLbl.frame.size.width = 229
        addSubview(questionLbl)
        //  selection button
        selectionBtn.setTitle("CreatePostTypeSelectionCTA".localized, for: .normal)
        selectionBtn.setTitleColor(UIColor(hexString: "#425AF2"), for: .normal)
        selectionBtn.setImage(#imageLiteral(resourceName: "chevron-down"), for: .normal)
        selectionBtn.titleLabel?.font = Fonts.dmSansRegular.customFont(size: 12)
        selectionBtn.frame.size.width = 131
        selectionBtn.frame.size.height = 29
        selectionBtn.layer.cornerRadius = 4
        selectionBtn.backgroundColor = UIColor(hexString: "#F3F4FE")
        selectionBtn.layer.masksToBounds = true
        selectionBtn.clipsToBounds = true
        selectionBtn.layer.borderWidth = 0
        selectionBtn.sizeToFit()
        selectionBtn.layoutIfNeeded()
        selectionBtn.semanticContentAttribute = .forceRightToLeft
        addSubview(selectionBtn)
        sepLine.backgroundColor = UIColor(hexString: "#D7D7D7")
        sepLine.frame.size.width = UIScreen.main.bounds.width
        sepLine.frame.size.height = 1
        addSubview(sepLine)
    }

    func setUpConstraints() {
        setUpUpperConstraints()
        setUpMidConstraints()
    }

    func setUpUpperConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        createPostTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: createPostTitle, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 154).isActive = true // 240
        NSLayoutConstraint(item: createPostTitle, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 27).isActive = true
        NSLayoutConstraint(item: createPostTitle, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 32).isActive = true
        NSLayoutConstraint(item: createPostTitle, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 23).isActive = true
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: cancelButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 44).isActive = true
        NSLayoutConstraint(item: cancelButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 44).isActive = true
        NSLayoutConstraint(item: cancelButton, attribute: .left, relatedBy: .equal, toItem: createPostTitle, attribute: .right, multiplier: 1, constant: 100).isActive = true // 70 proportional sizes
        NSLayoutConstraint(item: cancelButton, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 33).isActive = true
        NSLayoutConstraint(item: cancelButton, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: UIScreen.main.bounds.width - 48).isActive = true
    }

    func setUpMidConstraints() {
        questionLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: questionLbl, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 229).isActive = true
        NSLayoutConstraint(item: questionLbl, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 22).isActive = true
        NSLayoutConstraint(item: questionLbl, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: questionLbl, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 79).isActive = true
        selectionBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: selectionBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 131).isActive = true
        NSLayoutConstraint(item: selectionBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 28).isActive = true
        NSLayoutConstraint(item: selectionBtn, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 23).isActive = true
        NSLayoutConstraint(item: selectionBtn, attribute: .top, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 113).isActive = true
        sepLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: sepLine, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.width).isActive = true
        NSLayoutConstraint(item: sepLine, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 1).isActive = true
        NSLayoutConstraint(item: sepLine, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: sepLine, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 162).isActive = true
    }

    @objc private func cancelButtonTapped() {
        closeAction?()
    }
}
