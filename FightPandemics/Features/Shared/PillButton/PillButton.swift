//
//  PillButton.swift
//  FightPandemics
//
//  Created by Luciano Schillagi on 5/18/20.
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

class PillButton: UIButton {

    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPillButton()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupPillButton()
    }

    // MARK: User Action Methods
    @objc func pillBtnTapped() {}

    // MARK: Setup UI Methods
    func setupPillButton() {
        setTitleColor(.white, for: .normal)
        backgroundColor = .blue
        titleLabel?.font = Fonts.dmSansRegular.customFont(size: 22)
        layer.cornerRadius = 25
        layer.borderWidth = 0
        layer.borderColor = .none
        isEnabled = true
        alpha = 1
        addTarget(self,
                  action: #selector(self.pillBtnTapped),
                  for: .touchUpInside)
    }
}
