//
//  CreatePostBody.swift
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

class CreatePostBody: UIView {

    private var title = UITextField()
    private var body = UITextView()

    func setUp () {
        // set Up Title
        title.attributedPlaceholder = NSAttributedString(string: "CreatePostFormBodyTitlePlaceholder".localized, attributes: [NSAttributedString.Key.font: Fonts.poppinsBold.customFont(size: 22), NSAttributedString.Key.foregroundColor: UIColor(hexString: "#939393")])
        title.backgroundColor = UIColor.clear
        title.layer.backgroundColor = UIColor.clear.cgColor
        title.layer.borderWidth = 0
        title.layer.borderColor = UIColor.clear.cgColor
        title.makeSubview(of: self)
            .width(UIScreen.main.bounds.width - 50)
            .height(34)
            .leading(to: \.leadingAnchor, constant: 25)
            .top(to: \.topAnchor, constant: 26)
        // set up body
        body.text = "CreatePostFormBodyContentPlaceholder".localized
        body.textAlignment = .left
        body.textColor = UIColor(hexString: "#939393")
        body.font = Fonts.poppinsRegular.customFont(size: 14)
        body.makeSubview(of: self)
            .width(310)
            .height(235)
            .leading(to: \.leadingAnchor, constant: 25)
            .top(to: \.bottomAnchor, of: title, constant: 15)
    }

}
