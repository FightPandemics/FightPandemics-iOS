//
//  Subheader-OfferReqCard.swift
//  FightPandemics
//
//  Created by Luciano Schillagi on 6/15/20.
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

class SubHeaderOfferRequestCard: UIStackView {
    let userInitials = UILabel()
    let userName = UILabel()
    let userLocationName = UILabel()
    let userLocationStackView = UIStackView()
    let userNameAndLocationStackView = UIStackView()

    init(initials: String, name: String, location: String) {
        super.init(frame: .zero)

        // User Initials
        let userInitialsSize = CGSize(width: 100, height: 500)
        userInitials.frame.size = userInitialsSize
        userInitials.layer.cornerRadius = frame.size.height / 2
        userInitials.text = initials
        userInitials.textAlignment = .center
        userInitials.backgroundColor = .fightPandemicsGhostWhite()
        userInitials.layer.borderWidth = 1
        userInitials.layer.borderColor = UIColor.fightPandemicsNeonBlue().cgColor
        userInitials.translatesAutoresizingMaskIntoConstraints = false

        // User Name
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.attributedText = NSAttributedString(string: name,
                                                     attributes: [NSAttributedString.Key.font: Fonts.poppinsMedium.customFont(size: 22), NSAttributedString.Key.foregroundColor: UIColor.fightPandemicsNero()])

        // Point
        let point = UIImage(systemName: "circle.fill")
        let pointImageView = UIImageView(image: point)
        let size = CGSize(width: 10, height: 10)
        pointImageView.size(size)
        pointImageView.translatesAutoresizingMaskIntoConstraints = false

        // User Location
        userLocationName.translatesAutoresizingMaskIntoConstraints = false
        userLocationName.attributedText = NSAttributedString(string: location,
                                                             attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 11), NSAttributedString.Key.foregroundColor: UIColor.fightPandemicsNero()])

        // Stacks
        userLocationStackView.translatesAutoresizingMaskIntoConstraints = false
        userLocationStackView.distribution = .fillProportionally
        userLocationStackView.axis = .horizontal
        userLocationStackView.addArrangedSubview(pointImageView)
        userLocationStackView.addArrangedSubview(userLocationName)

        userNameAndLocationStackView.translatesAutoresizingMaskIntoConstraints = false
        userNameAndLocationStackView.axis = .vertical
        userNameAndLocationStackView.distribution = .fillProportionally
        userNameAndLocationStackView.addArrangedSubview(userName)
        userNameAndLocationStackView.addArrangedSubview(userLocationStackView)

        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        spacing = 10
        distribution = .fillProportionally

        addArrangedSubview(userInitials)
        addArrangedSubview(userNameAndLocationStackView)

//        makeSubview(of: self)
//            .left(to: \.leftAnchor, constant: 0)
//            .top(to: \.topAnchor, constant: 0)
//            .right(to: \.rightAnchor, constant: -80)
//            .bottom(to: \.bottomAnchor, constant: 0)
    }

    required init(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
