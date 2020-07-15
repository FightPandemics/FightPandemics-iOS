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
    private let avatar = Avatar()
    private let userNameLbl = UILabel()
    private let pointLbl = UILabel()
    private let userLocationLbl = UILabel()
    private let userLocationStackView = UIStackView()
    private let userNameAndLocationStackView = UIStackView()

    init(initials: String, name: String, location: String) {
        super.init(frame: .zero)

        // Avatar
        avatar.setUp(user: initials)

        // User Name
        userNameLbl.translatesAutoresizingMaskIntoConstraints = false
        userNameLbl.attributedText = NSAttributedString(string: name,
                                                        attributes: [NSAttributedString.Key.font: Fonts.poppinsMedium.customFont(size: 16), NSAttributedString.Key.foregroundColor: UIColor.fightPandemicsNero()])

        // Point
        let colorBlueCircle = UIColor(red: 66.0 / 255.0,
                                      green: 90.0 / 255.0,
                                      blue: 242.0 / 255.0,
                                      alpha: 1.0)
        pointLbl.attributedText = NSAttributedString(string: "•",
                                                     attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 20), NSAttributedString.Key.foregroundColor: colorBlueCircle])

        // User Location
        userLocationLbl.translatesAutoresizingMaskIntoConstraints = false
        userLocationLbl.attributedText = NSAttributedString(string: location,
                                                            attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 11), NSAttributedString.Key.foregroundColor: UIColor.fightPandemicsSuvaGrey()])

        // User Location Stack View
        userLocationStackView.translatesAutoresizingMaskIntoConstraints = false
        userLocationStackView.axis = .horizontal
        userLocationStackView.distribution = .fillProportionally
        userLocationStackView.spacing = 5
        userLocationStackView.addArrangedSubview(pointLbl)
        userLocationStackView.addArrangedSubview(userLocationLbl)

        // User Name & Location Stack View
        userNameAndLocationStackView.translatesAutoresizingMaskIntoConstraints = false
        userNameAndLocationStackView.axis = .vertical
        userNameAndLocationStackView.distribution = .fillProportionally
        userNameAndLocationStackView.addArrangedSubview(userNameLbl)
        userNameAndLocationStackView.addArrangedSubview(userLocationStackView)

        // Subheader Stack View
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        spacing = 10
        distribution = .fillProportionally
        addArrangedSubview(avatar)
        addArrangedSubview(userNameAndLocationStackView)
        makeConstraints()
    }

    required init(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func makeConstraints() {
        avatar.makeSubview(of: self)
            .top(to: \.topAnchor, relation: .equal, constant: 8, priority: .required)
            .leading(to: \.leadingAnchor)
            .width(50)
            .height(35)
        userNameAndLocationStackView.makeSubview(of: self)
            .top(to: \.topAnchor, relation: .equal, constant: 8, priority: .required)
            .leading(to: \.trailingAnchor, of: avatar, constant: 5)
            .width(100)
            .height(35)
        pointLbl.makeSubview(of: userLocationStackView)
            .right(to: \.leftAnchor, of: userLocationLbl, relation: .equal, constant: 14, priority: .required)
    }
}
