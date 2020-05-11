//
//  PostHeight.swift
//  FightPandemics
//
//  Created by ehsan sat on 5/11/20.
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

class PostHeight {
    // calculates the height of post based on its body and title
    var body: String?
    var title: String?

    init(body: String, title: String) {
        self.body = body
        self.title = title
    }
    func height () -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: CGFloat(UIScreen.main.bounds.width - 47), height: .greatestFiniteMagnitude))
        label.text = self.body
        label.font = UIFont(name: "System", size: 14)
        label.numberOfLines = 0
        label.sizeToFit()
        label.layoutIfNeeded()
        let bodyHeight = label.frame.size.height
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: CGFloat(UIScreen.main.bounds.width - 47), height: .greatestFiniteMagnitude))
        titleLabel.text = self.title
        titleLabel.font = UIFont(name: "System", size: 22)
        titleLabel.numberOfLines = 0
        titleLabel.sizeToFit()
        titleLabel.layoutIfNeeded()
        let titleHeight = titleLabel.frame.size.height
        let height = CGFloat(bodyHeight + titleHeight)
        return height
    }
}
