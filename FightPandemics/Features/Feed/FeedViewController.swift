//
//  FeedViewController.swift
//  FightPandemics
//
//  Created by Harlan Kellaway on 5/13/20.
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

final class FeedViewController: UIViewController {
        var mockUser = User(id: "123", firstName: "Lily", lastName: "Luke", email: "lily@luke.co", location: "Manchester, UK")

        private var avatar = Avatar()
        private var avatarView = AvatarView()
        private var feedPost = FeedPost()
        private var postFooter = PostFooter()
        private var indivOrg = IndividualOrg()
        private var visibility = Visibility()

        override func viewDidLoad() {
            super.viewDidLoad()

            setupUI()
        }

        private func setupUI() {
            self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

            self.avatar.setUp(user: mockUser, image: nil)
            self.avatarView = AvatarView()
            self.avatarView.setUp(user: mockUser, avatar: self.avatar)
            self.indivOrg.setUp()
            self.visibility.setUp()
            self.visibility.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

            let body = "Does anyone have an extra pack of disinfecting Clorox wipes? I would be very grateful if you could sell me one. Two people in our family have chronic pulmonary diseases, including my son. We are isolated, but my husband might infect us, as he works with people a lot."
            let title = "Disinfecting clorox wipes needed"

            self.feedPost.setUp(title: title, body: body + body, type: "Medical Supplies")
            self.postFooter.setUp(likeNum: 12, commentNum: 13, sendNum: 14)

            let firstView = UIView()
            firstView.frame = CGRect(x: 0, y: 200, width: (UIScreen.main.bounds.width), height: 600)
            self.view.addSubview(firstView)
    //        firstView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    //        firstView.addSubview(indivOrg)
            firstView.addSubview(self.visibility)

    //        let secondView = UIView()
    //        secondView.frame = CGRect(x: 0, y: 530, width: (UIScreen.main.bounds.width - 47), height: 300)
    //        self.view.addSubview(secondView)
        }
}
