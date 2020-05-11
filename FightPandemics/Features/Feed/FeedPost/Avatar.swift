//
//  Avatar.swift
//  FightPandemics
//
//  Created by ehsan sat on 5/11/20.
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

class Avatar: UIView {
    var image: UIImage?
    var text: String?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    init(text: String) {
        super.init(frame: CGRect())
        self.text = text
        setUp()
    }
    init(image: UIImage) {
        super.init(frame: CGRect())
        self.image = image
        setUp()
    }
    func setUp () {
        if self.text != nil {
            setUpWithText(txt: self.text!)
        } else if self.image != nil {
            setUpWithImage(image: self.image!)
        }
    }
    func setUpWithText (txt: String) {
        self.frame.origin.x = 23
        self.frame.origin.y = 23
        self.frame.size.width = 35
        self.frame.size.height = 35
        let label = UILabel()
        //both the letters should be capitalized; this only capitalize first one
        let capLetters = txt.uppercased()
        label.text = capLetters
        label.textAlignment = .center
        label.backgroundColor = .blue
        label.frame.size.width = self.frame.size.width
        label.frame.size.height = self.frame.size.height
        label.clipsToBounds = true
        label.layer.masksToBounds = true
        label.layer.cornerRadius = self.frame.size.height / 2
        label.font = UIFont(name: "System", size: 18)
        label.textColor = UIColor(hexString: "#425AF2")
        label.backgroundColor = UIColor(hexString: "#F3F4FE")
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(hexString: "#425AF2").cgColor
        self.addSubview(label)
    }
    func setUpWithImage (image: UIImage) {
        self.frame.origin.x = 23
        self.frame.origin.y = 23
        self.frame.size.width = 35
        self.frame.size.height = 35
        let imageView = UIImageView()
        imageView.image = image
        imageView.frame.size.width = self.frame.size.width
        imageView.frame.size.height = self.frame.size.height
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = self.frame.size.height / 2
        self.addSubview(imageView)
    }
}
