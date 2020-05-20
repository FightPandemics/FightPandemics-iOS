//
//  UIColor+FightPandemics.swift
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

import Foundation
import UIKit

extension UIColor {
    public convenience init(hexRGB value: UInt) {
        let red = CGFloat((value >> 16) & 0xFF) / 255
        let green = CGFloat((value >> 8) & 0xFF) / 255
        let blue = CGFloat((value >> 0) & 0xFF) / 255
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }

    // MARK: FightPandemics Palette

    @objc public static func fightPandemicsNeonBlue() -> UIColor { return UIColor(hexRGB: 0x425AF2) }
    @objc public static func fightPandemicsGhostWhite() -> UIColor { return UIColor(hexRGB: 0xF3F4FE) }
    @objc public static func fightPandemicsLightGrey() -> UIColor { return UIColor(hexRGB: 0xD7D7D7) }
    @objc public static func fightPandemicsNero() -> UIColor { return UIColor(hexRGB: 0x282828) }
    @objc public static func fightPandemicsSuvaGrey() -> UIColor { return UIColor(hexRGB: 0x939393) }
    @objc public static func fightPandemicsWhiteSmoke() -> UIColor { return UIColor(hexRGB: 0xF2F2F2) }
}
