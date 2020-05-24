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
    case offer = "Offer"
    case request = "Request"
}

class FeedOfferReqTime: UIView {
    private var offerReqLbl = UILabel()
    private var timeStampLbl = UILabel()
    private var dotView = UIView()
    private var offerReq: OfferRequestType
    var timeStamp: String?
    init(offerReq: OfferRequestType, timeStamp: String) {
        self.offerReq = offerReq
        self.timeStamp = timeStamp
        super.init(frame: .zero)
        setUp()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUp() {
        offerReqLbl.attributedText = NSAttributedString(string: offerReq.rawValue, attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 12), NSAttributedString.Key.foregroundColor: UIColor.fightPandemicsNeonBlue()])
        offerReqLbl.sizeToFit()
        offerReqLbl.layoutIfNeeded()
        offerReqLbl.lineBreakMode = .byClipping
        addSubview(offerReqLbl)
        dotView.backgroundColor = UIColor.fightPandemicsNeonBlue()
        dotView.frame.size = CGSize(width: 2, height: 2)
        dotView.layer.masksToBounds = true
        dotView.layer.cornerRadius = dotView.frame.size.height / 2
        addSubview(dotView)
        timeStampLbl.attributedText = NSAttributedString(string: timeStamp!, attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 12), NSAttributedString.Key.foregroundColor: UIColor.fightPandemicsSuvaGrey()])
        timeStampLbl.sizeToFit()
        timeStampLbl.layoutIfNeeded()
        timeStampLbl.lineBreakMode = .byClipping
        addSubview(timeStampLbl)
        makeConstraints()
    }

    func makeConstraints() {
        offerReqLbl.makeSubview(of: self)
            .width((offerReqLbl.attributedText?.size().width)!)
            .height(16)
            .right(to: \.leftAnchor, of: dotView, relation: .equal, constant: -7, priority: .required)
        dotView.makeSubview(of: self)
            .width(2)
            .height(2)
            .top(to: \.topAnchor, constant: 8)
            .left(to: \.rightAnchor, of: offerReqLbl, relation: .equal, constant: 7, priority: .required)
            .right(to: \.leftAnchor, of: timeStampLbl, relation: .equal, constant: -9, priority: .required)
        timeStampLbl.makeSubview(of: self)
            .width((timeStampLbl.attributedText?.size().width)!)
            .height(16)
            .left(to: \.rightAnchor, of: dotView, constant: 9)
    }
}
