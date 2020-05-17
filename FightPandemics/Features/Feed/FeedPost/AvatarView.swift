//
//  AvatarView.swift
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

class AvatarView: UIView {

    func setUp(user: User, avatar: Avatar) {
        self.frame.origin.x = (avatar.frame.origin.x)
        self.frame.origin.y = (avatar.frame.origin.y)
        self.frame.size.width = 230
        self.frame.size.height = 35
        let xOrigin = CGFloat(avatar.frame.width)
        let label = UILabel(frame: CGRect(x: (9 + xOrigin), y: 0, width: 167, height: 20))
        label.textColor = UIColor(hexString: "#282828")
        label.textAlignment = .left
        label.font = UIFont(name: "System", size: 14)
        let imageView = UIImageView(frame: CGRect(x: (9 + xOrigin), y: 25, width: 6, height: 6))
        imageView.image = #imageLiteral(resourceName: "logo")
        imageView.makeSubview(of: avatar)
        // wireframe version's width was 113 which was too small
        let locLable = UILabel(frame: CGRect(x: (22 + xOrigin), y: 21, width: 153, height: 14))
        locLable.text = user.location
        locLable.textColor = UIColor(hexString: "#939393")
        locLable.textAlignment = .left
        locLable.font = UIFont(name: "System", size: 11)
        locLable.makeSubview(of: avatar)
    }

}
