//
//  UIResponderExtension.swift
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

extension UIResponder {
    var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    var figmaScreenWidth: CGFloat {
        return 375.0
    }
    var figmaScreenHeight: CGFloat {
        return 812.0
    }
    var figmaToiOSVerticalScalingFactor: CGFloat {
        return screenHeight/figmaScreenHeight
    }
    var figmaToiOSHorizontalScalingFactor: CGFloat {
        return screenWidth/figmaScreenWidth
    }
    var contentMaxWidth: CGFloat {
        // 321 is the contentMaxWidth in Figma (px)
        return 321.0 * figmaToiOSHorizontalScalingFactor
    }
    var mainLogoWidth: CGFloat {
        return 264.0 * figmaToiOSHorizontalScalingFactor
    }
    var mainLogoHeight: CGFloat {
        return 164.0 * figmaToiOSVerticalScalingFactor
    }
    var buttonHeight: CGFloat {
        return 58.0 * figmaToiOSVerticalScalingFactor
    }
}
