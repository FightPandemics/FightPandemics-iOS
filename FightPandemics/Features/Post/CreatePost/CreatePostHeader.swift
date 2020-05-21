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
        //  header title
        createPostTitle.text = "CreatePostFormTitle".localized
        createPostTitle.textAlignment = .left
        createPostTitle.textColor = UIColor.black
        createPostTitle.frame.size.height = 27
        createPostTitle.frame.size.width = 154
        createPostTitle.font = Fonts.poppinsBold.customFont(size: 22)
        createPostTitle.numberOfLines = 0
        //  close button
        cancelButton.setImage(#imageLiteral(resourceName: "x"), for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        // question label
        questionLbl.text = "CreatePostFormSubtitle".localized
        questionLbl.textAlignment = .left
        questionLbl.font = Fonts.dmSansRegular.customFont(size: 13)
        questionLbl.frame.size.height = 22
        questionLbl.frame.size.width = 229
        //  selection button
        selectionBtn.setTitle("CreatePostTypeSelectionCTA".localized, for: .normal)
        selectionBtn.setTitleColor(UIColor.fightPandemicsNeonBlue(), for: .normal)
        selectionBtn.setImage(#imageLiteral(resourceName: "chevron-down"), for: .normal)
        selectionBtn.titleLabel?.font = Fonts.dmSansRegular.customFont(size: 12)
        selectionBtn.frame.size.width = 131
        selectionBtn.frame.size.height = 29
        selectionBtn.layer.cornerRadius = 4
        selectionBtn.backgroundColor = UIColor.fightPandemicsGhostWhite()
        selectionBtn.layer.masksToBounds = true
        selectionBtn.clipsToBounds = true
        selectionBtn.layer.borderWidth = 0
        selectionBtn.sizeToFit()
        selectionBtn.layoutIfNeeded()
        selectionBtn.semanticContentAttribute = .forceRightToLeft
        sepLine.backgroundColor = UIColor.fightPandemicsLightGrey()
        sepLine.frame.size.width = UIScreen.main.bounds.width
        sepLine.frame.size.height = 1
        setUpConstraints()
    }

    private func setUpConstraints() {
        createPostTitle.makeSubview(of: self)
            .width(154)
            .height(27)
            .top(to: \.topAnchor, constant: 32)
            .leading(to: \.leadingAnchor, constant: 23)
        cancelButton.makeSubview(of: self)
            .width(44)
            .height(44)
            .leading(to: \.trailingAnchor, constant: 100)
            .leading(to: \.trailingAnchor, of: createPostTitle, constant: 100)
            .top(to: \.topAnchor, constant: 33)
            .leading(to: \.leadingAnchor, constant: UIScreen.main.bounds.width - 48)
        questionLbl.makeSubview(of: self)
            .width(229)
            .height(22)
            .leading(to: \.leadingAnchor, constant: 23)
            .top(to: \.topAnchor, constant: 79)
        selectionBtn.makeSubview(of: self)
            .width(131)
            .height(28)
            .leading(to: \.leadingAnchor, constant: 23)
            .top(to: \.bottomAnchor, constant: 113)
        sepLine.makeSubview(of: self)
            .width(UIScreen.main.bounds.width)
            .height(1)
            .leading(to: \.leadingAnchor)
            .top(to: \.topAnchor, constant: 162)
    }

    @objc private func cancelButtonTapped() {
        closeAction?()
    }
}
