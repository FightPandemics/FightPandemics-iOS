//
//  RegularButton.swift
//  FightPandemics
//
//  Created by Luciano Schillagi on 5/16/20.
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

class RegularButton: UIButton {

    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupRegularButton()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupRegularButton()
    }

    // MARK: User Action Methods
    @objc func regularButtonTapped() {
        print("Regular Button Tapped!")
    }

    // MARK: Setup UI Methods
    func setupRegularButton() {
//      setTitle("Setting the title here", for: .normal)
        setTitleColor(.white, for: .normal)
        backgroundColor = .blue
        titleLabel?.font = UIFont(name: "DMSans-Regular", size: 18)
        layer.cornerRadius = 25
        addTarget(self,
                  action: #selector(self.regularButtonTapped),
                  for: .touchUpInside)
    }

}
