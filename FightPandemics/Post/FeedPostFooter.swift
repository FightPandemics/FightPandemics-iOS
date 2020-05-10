//
//  FeedPostFooter.swift
//  FightPandemics
//
//  Created by ehsan sat on 5/10/20.
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

class FeedPostFooter: UIView {
    var likeNum: Int?
    var commentNum: Int?
    var sendNum: Int?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        setUp()
    }
    init(likeNum: Int, commentNum: Int, sendNum: Int) {
        super.init(frame: CGRect())
        self.likeNum = likeNum
        self.commentNum = commentNum
        self.sendNum = sendNum
        setUp()
    }
    func setUp () {
        let likeImgView = UIImageView(image: #imageLiteral(resourceName: <#T##String#>))
        likeImgView.frame.size.width = 20
        likeImgView.frame.size.height = 17
        let likeLbl = UILabel()
        likeLbl.text = "\(self.likeNum)"
        likeLbl.font = UIFont(name: "System", size: 14)
        likeLbl.textAlignment = .center
        likeLbl.textColor = UIColor(hexString: "#939393")
        let commentImgView = UIImageView(image: #imageLiteral(resourceName: <#T##String#>))
        commentImgView.frame.size.width = 20
        commentImgView.frame.size.height = 20
        let commentLbl = UILabel()
        commentLbl.text = "\(self.commentNum)"
        commentLbl.font = UIFont(name: "System", size: 14)
        commentLbl.textAlignment = .center
        commentLbl.textColor = UIColor(hexString: "#939393")
        let sendImgView = UIImageView(image: #imageLiteral(resourceName: <#T##String#>))
        sendImgView.frame.size.width = 20
        sendImgView.frame.size.height = 17
        let sendLbl = UILabel()
        sendLbl.text = "\(self.sendNum)"
        sendLbl.font = UIFont(name: "System", size: 14)
        sendLbl.textAlignment = .center
        sendLbl.textColor = UIColor(hexString: "#939393")
        let firstStackView = UIStackView()
    }
}
