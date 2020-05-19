//
//  Fonts.swift
//  FightPandemics
//
//  Created by Onyekachi Ezeoke on 11/05/2020.
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

enum Fonts {
    // Regular

    case dmSansRegular
    case openSansRegular
    case poppinsRegular

    // Medium

    case dmSansMedium
    case poppinsMedium

    // Bold

    case dmSansBold
    case openSansBold
    case poppinsBold

    func customFont(size: CGFloat) -> UIFont {
        switch self {
        case .dmSansRegular:
            return .dmSansRegular(size: size)
        case .openSansRegular:
            return .openSansRegular(size: size)
        case .poppinsRegular:
            return .poppinsRegular(size: size)
        case .dmSansMedium:
            return .dmSansMedium(size: size)
        case .poppinsMedium:
            return .poppinsMedium(size: size)
        case .dmSansBold:
            return .dmSansBold(size: size)
        case .openSansBold:
            return .openSansBold(size: size)
        case .poppinsBold:
            return .poppinsBold(size: size)
        }
    }
}

private extension UIFont {
    static func dmSansRegular(size: CGFloat) -> UIFont {
        UIFont(name: "DMSans-Regular", size: size)!
    }

    static func openSansRegular(size: CGFloat) -> UIFont {
        UIFont(name: "OpenSans-Regular", size: size)!
    }

    static func poppinsRegular(size: CGFloat) -> UIFont {
        UIFont(name: "Poppins-Regular", size: size)!
    }

    static func dmSansMedium(size: CGFloat) -> UIFont {
        UIFont(name: "DMSans-Medium", size: size)!
    }

    static func poppinsMedium(size: CGFloat) -> UIFont {
        UIFont(name: "Poppins-Medium", size: size)!
    }

    static func dmSansBold(size: CGFloat) -> UIFont {
        UIFont(name: "DMSans-Bold", size: size)!
    }

    static func openSansBold(size: CGFloat) -> UIFont {
        UIFont(name: "OpenSans-Bold", size: size)!
    }

    static func poppinsBold(size: CGFloat) -> UIFont {
        UIFont(name: "Poppins-Bold", size: size)!
    }
}
