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
    func setUp(user: User, image: UIImage? = nil) {
        if let image = image {
            setUpWithImage(image: image)
        } else {
            setUpWithInitials(initials: user.initials)
        }
    }

    private func setUpWithInitials(initials: String?) {
        frame.origin.x = 23
        frame.origin.y = 23
        frame.size.width = 35
        frame.size.height = 35
        let label = UILabel()
        label.text = initials
        label.textAlignment = .center
        label.backgroundColor = .blue
        label.frame.size.width = frame.size.width
        label.frame.size.height = frame.size.height
        label.clipsToBounds = true
        label.layer.masksToBounds = true
        label.layer.cornerRadius = frame.size.height / 2
        label.font = UIFont(name: "System", size: 18)
        label.textColor = UIColor(hexString: "#425AF2")
        label.backgroundColor = UIColor(hexString: "#F3F4FE")
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(hexString: "#425AF2").cgColor
        addSubview(label)
    }

    private func setUpWithImage(image: UIImage) {
        frame.origin.x = 23
        frame.origin.y = 23
        frame.size.width = 35
        frame.size.height = 35
        let imageView = UIImageView()
        imageView.image = image
        imageView.frame.size.width = frame.size.width
        imageView.frame.size.height = frame.size.height
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = frame.size.height / 2
        addSubview(imageView)
    }
}
