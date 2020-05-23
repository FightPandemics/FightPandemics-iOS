//
//  FeedCatTag.swift
//  FightPandemics
//
//  Created by ehsan sat on 5/24/20.
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

class FeedCatTag: UIView {
    private var categoryLbl = UILabel()
    var categoryTagTxt: String
    init(categoryTagTxt: String) {
        self.categoryTagTxt = categoryTagTxt
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUp() {
        categoryLbl.attributedText = NSAttributedString(string: categoryTagTxt, attributes: [NSAttributedString.Key.font: Fonts.dmSansRegular.customFont(size: 12), NSAttributedString.Key.foregroundColor: UIColor.fightPandemicsNeonBlue()])
        categoryLbl.backgroundColor = UIColor.fightPandemicsGhostWhite()
        let lblWidth = (categoryLbl.attributedText?.size().width)
        categoryLbl.frame.size = CGSize(width: lblWidth! + 20, height: 30)
        categoryLbl.textAlignment = .center
        categoryLbl.layer.masksToBounds = true
        categoryLbl.layer.cornerRadius = 4
        categoryLbl.makeSubview(of: self)
            .width(categoryLbl.frame.size.width)
            .height(30)
    }
}
