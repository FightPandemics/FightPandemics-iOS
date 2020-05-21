//
//  ClearFilterBtn.swift
//  FightPandemics
//
//  Created by ehsan sat on 5/22/20.
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

class ClearFilterBtn: UIView {
    private var clearFilterBtn = UIButton()
    func setUp() {
        clearFilterBtn.setAttributedTitle(NSAttributedString(string: "Clear Filters", attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 15), NSAttributedString.Key.foregroundColor: UIColor.fightPandemicsNeonBlue()]), for: .normal)
        clearFilterBtn.backgroundColor = UIColor.clear
        clearFilterBtn.frame.size.height = 45
        clearFilterBtn.clipsToBounds = true
        clearFilterBtn.layer.cornerRadius = clearFilterBtn.frame.size.height / 2
        clearFilterBtn.layer.borderWidth = 1
        clearFilterBtn.layer.borderColor = UIColor.fightPandemicsNeonBlue().cgColor
        clearFilterBtn.makeSubview(of: self)
            .width(158)
            .height(45)
            .top(to: \.topAnchor, constant: 0)
            .left(to: \.leftAnchor, constant: 0)
            .right(to: \.rightAnchor, constant: 0)
    }
}
