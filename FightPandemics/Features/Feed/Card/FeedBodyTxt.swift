//
//  FeedBodyTxt.swift
//  FightPandemics
//
//  Created by ehsan sat on 5/26/20.
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

class FeedBodyTxt: UIView {
    private var bodyLbl = UILabel()
    private var viewMore = FeedViewMoreBtn()
    var text: String
    init(text: String) {
        self.text = text
        super.init(frame: .zero)
        setUp()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUp() {
        bodyLbl.attributedText = NSAttributedString(string: text, attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 14), NSAttributedString.Key.foregroundColor: UIColor.fightPandemicsNero()])
        bodyLbl.textAlignment = .left
        bodyLbl.numberOfLines = 0
        bodyLbl.lineBreakMode = .byWordWrapping
        bodyLbl.makeSubview(of: self)
            .width(UIScreen.main.bounds.width - 40)
            .height(heighOfBody(text: text))
        viewMore.makeSubview(of: self)
            .width(85)
            .height(16)
            .right(to: \.rightAnchor, constant: -5)
            .bottom(to: \.bottomAnchor, constant: -5)
    }

    func heighOfBody(text: String) -> CGFloat {
        let boundingBox = NSString(string: text).boundingRect(with: CGSize(width: UIScreen.main.bounds.width - 40, height: .greatestFiniteMagnitude), options: NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin), attributes: [NSAttributedString.Key.font: Fonts.poppinsBold.customFont(size: 14)], context: nil)
        return boundingBox.height
    }
}
