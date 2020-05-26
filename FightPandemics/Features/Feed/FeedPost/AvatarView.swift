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
    private var userNameLbl = UILabel()
    private var userLocLbl = UILabel()
    private var dotView = UIView()
    func setUp(user: User, avatar _: Avatar) {
        userNameLbl.attributedText = NSAttributedString(string: user.firstName + " " + user.lastName, attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 14), NSAttributedString.Key.foregroundColor: UIColor.fightPandemicsNero()])
        userNameLbl.textAlignment = .left
        userNameLbl.sizeToFit()
        userNameLbl.lineBreakMode = .byClipping
        userNameLbl.makeSubview(of: self)
            .width((userNameLbl.attributedText?.size().width)! + 30)
            .height(20)
            .left(to: \.leftAnchor, constant: 0)
            .top(to: \.topAnchor, constant: 0)
        dotView.backgroundColor = UIColor.fightPandemicsNeonBlue()
        dotView.frame.size = CGSize(width: 6, height: 6)
        dotView.layer.masksToBounds = true
        dotView.layer.cornerRadius = dotView.frame.size.height / 2
        dotView.makeSubview(of: self)
            .width(6)
            .height(6)
            .left(to: \.leftAnchor, constant: 0)
            .top(to: \.topAnchor, constant: 25)
        userLocLbl.attributedText = NSAttributedString(string: user.location!, attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 14), NSAttributedString.Key.foregroundColor: UIColor.fightPandemicsSuvaGrey()])
        userLocLbl.textAlignment = .left
        userLocLbl.sizeToFit()
        userLocLbl.lineBreakMode = .byClipping
        userLocLbl.makeSubview(of: self)
            .width((userLocLbl.attributedText?.size().width)! + 30)
            .height(15)
            .left(to: \.leftAnchor, constant: 10)
            .top(to: \.topAnchor, constant: 21)
    }
}
