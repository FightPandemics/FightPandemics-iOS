//
//  StyleGuide.swift
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

enum Style {

    // Regular

    case dmSansRegular18
    case openSansRegular18
    case poppinsRegular11

    // Medium

    case dmSansMedium16
    case poppinsMedium18

    // Bold

    case dmSansBold12
    case openSansBold13
    case poppinsBold18
    case poppinsBold22

    var font: UIFont {
        customFont()
    }

    func customFont() -> UIFont {
        switch self {
        case .dmSansRegular18:
            return .dmSansRegular(size: 18)
        case .openSansRegular18:
            return .openSansRegular(size: 18)
        case .poppinsRegular11:
            return .poppinsRegular(size: 11)
        case .dmSansMedium16:
            return .dmSansMedium(size: 16)
        case .poppinsMedium18:
            return .poppinsMedium(size: 18)
        case .dmSansBold12:
            return .dmSansBold(size: 12)
        case .openSansBold13:
            return .openSansBold(size: 13)
        case .poppinsBold18:
            return .poppinsBold(size: 18)
        case .poppinsBold22:
            return .poppinsBold(size: 22)
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
