//
//  FeedViewController.swift
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

class FeedPrototypeViewController: UIViewController {
    var mockUser = User(id: "123", firstName: "Lily", lastName: "Luke", email: "lily@luke.co", location: "Manchester, UK")

    private var avatar = Avatar()
    private var avatarView = AvatarView()
    private var feedPost = FeedPost()
    private var postFooter = PostFooter()
    private var indivOrg = IndividualOrg()
    private var visibility = PostVisibilitySelectionView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

        avatar.setUp(user: mockUser, image: nil)
        avatarView = AvatarView()
        avatarView.setUp(user: mockUser, avatar: avatar)
        indivOrg.setUp()
        visibility.setUp()

        let body = "Does anyone have an extra pack of disinfecting Clorox wipes? I would be very grateful if you could sell me one. Two people in our family have chronic pulmonary diseases, including my son. We are isolated, but my husband might infect us, as he works with people a lot."
        let title = "Disinfecting clorox wipes needed"

        feedPost.setUp(title: title, body: body + body, type: "Medical Supplies")
        postFooter.setUp(likeNum: 12, commentNum: 13, sendNum: 14)

        let firstView = UIView()
        firstView.frame = CGRect(x: 0, y: 50, width: UIScreen.main.bounds.width, height: 600)
        firstView.makeSubview(of: view)
        visibility.makeSubview(of: firstView)
        let secondView = UIView()
        secondView.frame = CGRect(x: 0, y: 530, width: UIScreen.main.bounds.width - 47, height: 300)
        view.addSubview(secondView)
    }
}
