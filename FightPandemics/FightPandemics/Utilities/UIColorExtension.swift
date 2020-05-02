//
//  UIColorExtension.swift
//  COVIDWatch iOS
//
//  Created by Isaiah Becker-Mayer on 4/2/20.
//  Copyright © 2020 IZE. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)

        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }

        var color: UInt32 = 0
        scanner.scanHexInt32(&color)

        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask

        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

    func toHexString() -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)

        let rgb: Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0

        return String(format: "#%06x", rgb)
    }

    struct Primary {
        static let News = UIColor(hexString: "#F0F4FE")
        static let Teal = UIColor(hexString: "#56CCF2")
        static let White = UIColor(hexString: "#ffffff")
        static let Sand = UIColor(hexString: "#EAE9E7")
        static let Elderberry = UIColor(hexString: "#2c007b")
        static let Gray = UIColor(hexString: "#585858")
    }

    struct Secondary {
        static let Lavender = UIColor(hexString: "#a680b7")
        static let Tangerine = UIColor(hexString: "#f05452")
        static let LightGray = UIColor(hexString: "#BDBDBD")
    }
}
