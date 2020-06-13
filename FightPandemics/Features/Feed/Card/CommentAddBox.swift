//
//  CommentAddBox.swift
//  FightPandemics
//
//  Created by ehsan sat on 6/12/20.
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

class CommentAddBox: UIView, UITextFieldDelegate {
    lazy var commentBoxTxtField: UITextField = {
        let commentBox = UITextField()
        commentBox.delegate = self
        let leftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 33, height: 50))
        commentBox.leftView = leftPadding
        commentBox.leftViewMode = .always
        commentBox.backgroundColor = UIColor.fightPandemicsLightGrey()
        commentBox.attributedPlaceholder = NSAttributedString(string: "Write a comment ...".localized, attributes: [NSAttributedString.Key.font: Fonts.poppinsMedium.customFont(size: 14), NSAttributedString.Key.foregroundColor: UIColor.fightPandemicsSuvaGrey()])
        commentBox.frame.size = CGSize(width: UIScreen.main.bounds.width - 46, height: 46)
        commentBox.layer.masksToBounds = true
        commentBox.layer.cornerRadius = commentBox.frame.height / 2
        return commentBox
    }()

    lazy var sendButton: UIButton = {
        let sendBtn = UIButton()
        sendBtn.setImage(#imageLiteral(resourceName: "send"), for: .normal)
        sendBtn.imageView?.contentMode = .scaleAspectFit
        sendBtn.frame.size = CGSize(width: 20, height: 20)
        sendBtn.isHidden = true
        sendBtn.addTarget(self, action: #selector(sendBtnPressed), for: .touchUpInside)
        return sendBtn
    }()

    init() {
        super.init(frame: CGRect.zero)
        makeConstraints()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func sendBtnPressed() {
        commentBoxTxtField.resignFirstResponder()
        sendButton.isHidden = false
    }

    private func makeConstraints() {
        commentBoxTxtField.makeSubview(of: self)
            .width(UIScreen.main.bounds.width - 50)
            .height(46)
            .left(to: \.leftAnchor, constant: 18)
            .top(to: \.topAnchor, constant: 9)
            .bottom(to: \.bottomAnchor, constant: -7)
    }

    func textFieldDidBeginEditing(_: UITextField) {
        UIView.animate(withDuration: 1) {
            self.commentBoxTxtField.makeSubview(of: self)
                .width(UIScreen.main.bounds.width - 50)
                .left(to: \.leftAnchor, constant: 5)
                .top(to: \.topAnchor, constant: 9)
                .bottom(to: \.bottomAnchor, constant: -7)
            self.commentBoxTxtField.layoutIfNeeded()
            self.sendButton.isHidden = false
            self.sendButton.makeSubview(of: self)
                .right(to: \.rightAnchor, constant: -13)
                .top(to: \.topAnchor, constant: 21)
                .bottom(to: \.bottomAnchor, constant: -21)
        }
    }

    func textFieldDidEndEditing(_: UITextField) {}

    func textFieldShouldReturn(_: UITextField) -> Bool {
        return false
    }
}
