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
        title.placeholder = "Title"
        title.attributedPlaceholder = NSAttributedString(string: "Title", attributes: [NSAttributedString.Key.font: Fonts.poppinsBold.customFont(size: 22), NSAttributedString.Key.foregroundColor: UIColor(hexString: "#939393")])
        title.backgroundColor = UIColor.clear
        title.layer.backgroundColor = UIColor.clear.cgColor
        title.layer.borderWidth = 0
        title.layer.borderColor = UIColor.clear.cgColor
        self.addSubview(title)
        // set up body
        body.text = "Description of your post."
        body.textAlignment = .left
        body.textColor = UIColor(hexString: "#939393")
        body.font = Fonts.poppinsRegular.customFont(size: 14)
        self.addSubview(body)
        makeConstraints()
    }
    func makeConstraints () {
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: title, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: (UIScreen.main.bounds.width - 50)).isActive = true
        NSLayoutConstraint(item: title, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 34).isActive = true
        NSLayoutConstraint(item: title, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 25).isActive = true
        NSLayoutConstraint(item: title, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 26).isActive = true
        body.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: body, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 310).isActive = true
        NSLayoutConstraint(item: body, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 235).isActive = true
        NSLayoutConstraint(item: body, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 25).isActive = true
        NSLayoutConstraint(item: body, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 15).isActive = true
    }
}
