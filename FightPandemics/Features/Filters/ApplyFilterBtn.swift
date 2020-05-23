//
//  ApplyFilterBtn.swift
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

class ApplyFilterBtn: UIButton {
    private var btnSelection: Bool?
    override init(frame _: CGRect) {
        super.init(frame: CGRect.zero)
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }

    func setUp() {
        btnSelection = false
        setAttributedTitle(NSAttributedString(string: "Apply Filters", attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 15), NSAttributedString.Key.foregroundColor: UIColor.fightPandemicsNeonBlue()]), for: .normal)
        backgroundColor = UIColor.clear
        frame.size.height = 45
        clipsToBounds = true
        layer.cornerRadius = frame.size.height / 2
        layer.borderWidth = 1
        layer.borderColor = UIColor.fightPandemicsNeonBlue().cgColor
        addTarget(self, action: #selector(btnSelect), for: .touchUpInside)
    }

    @objc func btnSelect() {
        btnSelection = !btnSelection!
        if btnSelection == true {
            setAttributedTitle(NSAttributedString(string: "Apply Filters", attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 15), NSAttributedString.Key.foregroundColor: UIColor.white]), for: .selected)
            backgroundColor = UIColor.fightPandemicsNeonBlue()
        } else {
            setAttributedTitle(NSAttributedString(string: "Apply Filters", attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 15), NSAttributedString.Key.foregroundColor: UIColor.fightPandemicsNeonBlue()]), for: .normal)
            backgroundColor = UIColor.clear
        }
    }
}
