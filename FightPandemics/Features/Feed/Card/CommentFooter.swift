//
//  CommentFooter.swift
//  FightPandemics
//
//  Created by ehsan sat on 6/5/20.
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

class CommentFooter: UIView {
    var timeStamp: String
    var likeBtn = UIButton()
    var replyBtn = UIButton()
    private var timeStampLbl = UILabel()
    private var stackView = UIStackView()
    init(timeStamp: String) {
        self.timeStamp = timeStamp
        super.init(frame: .zero)
        setUp()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUp() {
        timeStampLbl.attributedText = NSAttributedString(string: timeStamp, attributes: [NSAttributedString.Key.font: Fonts.worksansRegular.customFont(size: 11), NSAttributedString.Key.foregroundColor: UIColor.fightPandemicsNero()])
        addSubview(timeStampLbl)
        likeBtn.setAttributedTitle(NSAttributedString(string: "Like", attributes: [NSAttributedString.Key.font: Fonts.worksansRegular.customFont(size: 11), NSAttributedString.Key.foregroundColor: UIColor.fightPandemicsNero()]), for: .normal)
        addSubview(likeBtn)
        replyBtn.setAttributedTitle(NSAttributedString(string: "Reply", attributes: [NSAttributedString.Key.font: Fonts.worksansRegular.customFont(size: 11), NSAttributedString.Key.foregroundColor: UIColor.fightPandemicsNero()]), for: .normal)
        addSubview(replyBtn)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.addArrangedSubview(timeStampLbl)
        stackView.addArrangedSubview(likeBtn)
        stackView.addArrangedSubview(replyBtn)
        stackView.makeSubview(of: self)
            .left(to: \.leftAnchor, constant: 0)
            .top(to: \.topAnchor, constant: 0)
            .right(to: \.rightAnchor, constant: 0)
            .bottom(to: \.bottomAnchor, constant: 0)
    }
}
