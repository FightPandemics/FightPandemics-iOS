//
//  UIViewExtension.swift
//  FightPandemics
//
//  Created by Andreas Ink on 4/28/20.
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

enum LinePosition {
    case top
    case bottom
}

extension UIView {

    func addLine(position: LinePosition, color: UIColor, width: Double) {
        let lineView = UIView()
        lineView.backgroundColor = color
        lineView.translatesAutoresizingMaskIntoConstraints = false // This is important!
        self.addSubview(lineView)

        let metrics = ["width": NSNumber(value: width)]
        let views = ["lineView": lineView]
        self.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|[lineView]|",
            options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: metrics, views: views)
        )

        switch position {
        case .top:
            self.addConstraints(
                NSLayoutConstraint.constraints(
                    withVisualFormat: "V:|[lineView(width)]",
                    options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: metrics, views: views
                )
            )
        case .bottom:
            self.addConstraints(
                NSLayoutConstraint.constraints(
                    withVisualFormat: "V:[lineView(width)]|",
                    options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: metrics, views: views
                )
            )
        }
    }
}
