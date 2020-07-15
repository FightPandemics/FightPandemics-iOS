//
//  FeedOfferReqTime.swift
//  FightPandemics
//
//  Created by ehsan sat on 5/24/20.
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

enum OfferRequestType: String {
    case offers = "Offers   •"
    case requests = "Requests  •"
}

class FeedOfferReqTime: UIStackView {
    private var offerReqLbl = UILabel()
    private var timeStampLbl = UILabel()

    private var offerReq: OfferRequestType
    var timeStamp: String?

    init(offerReq: OfferRequestType, timeStamp: String) {
        self.offerReq = offerReq
        self.timeStamp = timeStamp
        super.init(frame: .zero)

        offerReqLbl.attributedText = NSAttributedString(string: offerReq.rawValue, attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 11), NSAttributedString.Key.foregroundColor: UIColor.fightPandemicsNeonBlue()])

        timeStampLbl.attributedText = NSAttributedString(string: timeStamp, attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 11), NSAttributedString.Key.foregroundColor: UIColor.fightPandemicsSuvaGrey()])

        axis = NSLayoutConstraint.Axis.horizontal
        distribution = .fillProportionally
        translatesAutoresizingMaskIntoConstraints = false
        addArrangedSubview(offerReqLbl)
        addArrangedSubview(timeStampLbl)
    }

    required init(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
