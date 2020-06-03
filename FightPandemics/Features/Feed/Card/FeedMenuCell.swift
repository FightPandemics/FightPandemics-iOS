//
//  FeedMenuCell.swift
//  FightPandemics
//
//  Created by Onyekachi Ezeoke on 03/06/2020.
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

class FeedMenuCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: self)
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let titleLabel = UILabel()
    private let bottomLinerView = UIView()

    func updateLabel(with text: String) {
        titleLabel.text = text
    }

    override var isHighlighted: Bool {
        didSet {
            titleLabel.font = isHighlighted ? Fonts.poppinsBold.customFont(size: 16) : Fonts.poppinsRegular.customFont(size: 16)
        }
    }

    override var isSelected: Bool {
        didSet {
            titleLabel.font = isSelected ? Fonts.poppinsBold.customFont(size: 16) : Fonts.poppinsRegular.customFont(size: 16)
        }
    }

    private func setupViews() {
        backgroundColor = .white
        titleLabel.font = Fonts.poppinsRegular.customFont(size: 16)
        titleLabel.textColor = #colorLiteral(red: 0.1568627451, green: 0.1568627451, blue: 0.1568627451, alpha: 1)
        titleLabel.makeSubview(of: self)
            .centerX(to: \.centerXAnchor)
            .centerY(to: \.centerYAnchor)

        bottomLinerView.backgroundColor = .lightGray
        bottomLinerView.makeSubview(of: self)
            .bottom(to: \.bottomAnchor)
            .width(to: \.widthAnchor)
            .height(1)
    }
}
