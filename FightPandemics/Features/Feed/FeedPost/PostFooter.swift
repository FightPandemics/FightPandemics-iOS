//
//  PostFooter.swift
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

class PostFooter: UIView {

    private var likeImg = UIImageView(image: #imageLiteral(resourceName: "favorite_24px"))
    private var likeLbl = UILabel()
    private var commentImg = UIImageView(image: #imageLiteral(resourceName: "favorite_24px"))
    private var commentLbl = UILabel()
    private var sendImg = UIImageView(image: #imageLiteral(resourceName: "send_24px"))
    private var sendLbl = UILabel()
    private var cmtTextField = UITextField()

    func setUp(likeNum: Int, commentNum: Int, sendNum: Int) {
        // like image
        likeImg.frame.size.width = 20
        likeImg.frame.size.height = 18
        // like label
        likeLbl.text = "\(likeNum)"
        likeLbl.textAlignment = .left
        likeLbl.textColor = UIColor(hexString: "#939393")
        likeLbl.font = UIFont(name: "System", size: 14)
        // comment image
        commentImg.frame.size.width = 20
        commentImg.frame.size.height = 20
        // comment label
        commentLbl.text = "\(commentNum)"
        commentLbl.textAlignment = .left
        commentLbl.textColor = UIColor(hexString: "#939393")
        commentLbl.font = UIFont(name: "System", size: 14)
        // send image
        sendImg.frame.size.width = 20
        sendImg.frame.size.height = 17
        // send label
        sendLbl.text = "\(sendNum)"
        sendLbl.textAlignment = .left
        sendLbl.textColor = UIColor(hexString: "#939393")
        sendLbl.font = UIFont(name: "System", size: 14)
        // comment text field
        cmtTextField.frame.size.width = CGFloat(UIScreen.main.bounds.width - 47)
        cmtTextField.frame.size.height = 46
        cmtTextField.font = UIFont(name: "System", size: 14)
        cmtTextField.placeholder = "FeedPostWriteCommentCTA".localized
        cmtTextField.layer.cornerRadius = cmtTextField.frame.size.height / 2
        cmtTextField.layer.masksToBounds = true
        cmtTextField.layer.borderWidth = 0
        cmtTextField.backgroundColor = UIColor(hexString: "#F6F7FB")
        makeConstraints()
    }

    private func makeConstraints () {
        self.translatesAutoresizingMaskIntoConstraints = false
        addWidthConstraint(UIScreen.main.bounds.width - 47)
        addHeightConstraint(140)
        likeImg.makeSubview(of: self)
            .top(to: \.topAnchor, constant: 24)
            .leading(to: \.leadingAnchor, constant: 25)
        likeLbl.makeSubview(of: self)
            .top(to: \.topAnchor, constant: 24)
            .leading(to: \.leadingAnchor, constant: 55)
        commentImg.makeSubview(of: self)
            .top(to: \.topAnchor, constant: 24)
            .leading(to: \.leadingAnchor, constant: 117)
        commentLbl.makeSubview(of: self)
            .top(to: \.topAnchor, constant: 24)
            .leading(to: \.leadingAnchor, constant: 147)
        sendImg.makeSubview(of: self)
            .top(to: \.topAnchor, constant: 24)
            .leading(to: \.leadingAnchor, constant: 199)
        sendLbl.makeSubview(of: self)
            .top(to: \.topAnchor, constant: 24)
            .leading(to: \.leadingAnchor, constant: 225)
        cmtTextField.makeSubview(of: self)
            .width(UIScreen.main.bounds.width - 47)
            .height(46)
            .top(to: \.topAnchor, constant: 70)
            .leading(to: \.leadingAnchor, constant: 25)
    }

}
