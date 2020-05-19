//
//  OpenSourceTableViewCell.swift
//  FightPandemics
//
//  Created by Harlan Kellaway on 5/18/20.
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

open class OpenSourceTableViewCell: UITableViewCell {
    static let reuseIdentifier = String(describing: self)

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.setUp()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Instance methods

    func configure(license: (OpenSourceLicense, HTML)) {
        self.textLabel?.attributedText = attributedContent(license: license)
        self.textLabel?.textColor = .black
        self.backgroundColor = .white
    }

    // MARK: - Private instance methods

    private func setUp() {
        textLabel?.numberOfLines = 0
        accessoryType = .none
        selectionStyle = .none
    }

    private func attributedContent(license: (OpenSourceLicense, HTML)) -> NSMutableAttributedString {
        let titleAttributes = [NSAttributedString.Key.font: Fonts.openSansBold.customFont(size: 18)]
        let detailAttributes = [NSAttributedString.Key.font: Fonts.openSansRegular.customFont(size: 14)]
        let content = NSMutableAttributedString(string: license.0.title, attributes: titleAttributes)
        content.append(NSAttributedString(string: "\n\n"))
        content.append(NSAttributedString(string: license.1, attributes: detailAttributes))
        return content
    }

}
