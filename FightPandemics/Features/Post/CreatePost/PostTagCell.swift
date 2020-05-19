//
//  PostTagCell.swift
//  FightPandemics
//
//  Created by Onyekachi Ezeoke on 18/05/2020.
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

class PostTagCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: self)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    let titleLabel = UILabel()

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateLabel(with text: String) {
        titleLabel.text = text
    }

    private func setupView() {
        backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        layer.cornerRadius = 4
        layer.masksToBounds = true
        titleLabel.textAlignment = .center
        titleLabel.font = Fonts.dmSansRegular.customFont(size: 14)
        titleLabel.textColor = #colorLiteral(red: 0.1568627451, green: 0.1568627451, blue: 0.1568627451, alpha: 1)
        titleLabel.makeSubview(of: contentView)
            .pinToEdges(withInsets: UIEdgeInsets(top: 4, left: 8, bottom: -4, right: -8))
    }
}
