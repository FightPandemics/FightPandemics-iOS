//
//  TagView.swift
//  FightPandemics
//
//  Created by Moazzam Tahir on 15/05/2020.
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

import Foundation
import UIKit

class TagView: UIView {

    var title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = Fonts.dmSansRegular.customFont(size: 12)
        label.textColor = UIColor(named: "DarkGrayTextColor")
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        return label
    }()

    var isSelected: Bool = false

    init(title: String) {
        super.init(frame: .zero)

        self.title.text = title

        initializeUI()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        initializeUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        initializeUI()
    }

    func initializeUI() {
        title.makeSubview(of: self)
            .pinToEdges().height(22)
        addTapGesture()

        self.backgroundColor = UIColor(named: "TagBackgroundGrayColor")
        self.layer.cornerRadius = 5
    }

    func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(makeSelection))
        self.addGestureRecognizer(tapGesture)
    }

    @objc
    func makeSelection() {
        self.isSelected.toggle()

        if isSelected {
            self.backgroundColor = UIColor(named: "TagBackgroundColor")
            title.textColor = UIColor(named: "TagLabelColor")
        } else {
            self.backgroundColor = UIColor(named: "TagBackgroundGrayColor")
            title.textColor = UIColor(named: "DarkGrayTextColor")
        }
    }

}
