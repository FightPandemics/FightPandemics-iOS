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
        self.addSubview(likeImg)
        // like label
        likeLbl.text = "\(likeNum)"
        likeLbl.textAlignment = .left
        likeLbl.textColor = UIColor(hexString: "#939393")
        likeLbl.font = UIFont(name: "System", size: 14)
        self.addSubview(likeLbl)
        // comment image
        commentImg.frame.size.width = 20
        commentImg.frame.size.height = 20
        self.addSubview(commentImg)
        // comment label
        commentLbl.text = "\(commentNum)"
        commentLbl.textAlignment = .left
        commentLbl.textColor = UIColor(hexString: "#939393")
        commentLbl.font = UIFont(name: "System", size: 14)
        self.addSubview(commentLbl)
        // send image
        sendImg.frame.size.width = 20
        sendImg.frame.size.height = 17
        self.addSubview(sendImg)
        // send label
        sendLbl.text = "\(sendNum)"
        sendLbl.textAlignment = .left
        sendLbl.textColor = UIColor(hexString: "#939393")
        sendLbl.font = UIFont(name: "System", size: 14)
        self.addSubview(sendLbl)
        // comment text field
        cmtTextField.frame.size.width = CGFloat(UIScreen.main.bounds.width - 47)
        cmtTextField.frame.size.height = 46
        cmtTextField.font = UIFont(name: "System", size: 14)
        cmtTextField.placeholder = "        Write a comment      "
        cmtTextField.layer.cornerRadius = cmtTextField.frame.size.height / 2
        cmtTextField.layer.masksToBounds = true
        cmtTextField.layer.borderWidth = 0
        cmtTextField.backgroundColor = UIColor(hexString: "#F6F7FB")
        self.addSubview(cmtTextField)
        makeConstraints()
    }

    private func makeConstraints () {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: (UIScreen.main.bounds.width - 47)).isActive = true
        NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 140).isActive = true
        likeImg.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: likeImg, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 24).isActive = true
        NSLayoutConstraint(item: likeImg, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 25).isActive = true
        likeLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: likeLbl, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 24).isActive = true
        NSLayoutConstraint(item: likeLbl, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 55).isActive = true
        commentImg.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: commentImg, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 24).isActive = true
        NSLayoutConstraint(item: commentImg, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 117).isActive = true
        commentLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: commentLbl, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 24).isActive = true
        NSLayoutConstraint(item: commentLbl, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 147).isActive = true
        sendImg.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: sendImg, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 24).isActive = true
        NSLayoutConstraint(item: sendImg, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 199).isActive = true
        sendLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: sendLbl, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 24).isActive = true
        NSLayoutConstraint(item: sendLbl, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 225).isActive = true
        cmtTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: cmtTextField, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: (UIScreen.main.bounds.width - 47)).isActive = true
        NSLayoutConstraint(item: cmtTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 46).isActive = true
        NSLayoutConstraint(item: cmtTextField, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 70).isActive = true
        NSLayoutConstraint(item: cmtTextField, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 25).isActive = true
    }

}
