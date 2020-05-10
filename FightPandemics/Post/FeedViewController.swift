//
//  FeedViewController.swift
//  FightPandemics
//
//  Created by ehsan sat on 5/9/20.
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

class FeedViewController: UIViewController {
    var avatar: Avatar!
    var avatarView: AvatarView!
    var postContainer: PostContainer!
    var feedPost: FeedPost!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.avatar = Avatar(text: "LL")
        self.avatarView = AvatarView(name: "Lily Luke", location: "Manchester, UK", avatar: avatar)
        let body1 = "Does anyone have an extra pack of disinfecting Clorox wipes? I would be very grateful if you could sell me one. Two people in our family have chronic pulmonary diseases, including my son. We are isolated, but my husband might infect us, as he works with people a lot."
        let body2 = "Does anyone have an extra pack of disinfecting Clorox wipes? I would be very grateful if you could sell me one. Two people in our family have chronic pulmonary diseases, including my son. We are isolated, but my husband might infect us, as he works with people a lot."
        let body = body1 + body2
        let title = "Disinfecting clorox wipes needed"
        self.postContainer = PostContainer(body: body, title: title)
        self.postContainer.frame.origin.y = 100
        self.view.addSubview(postContainer)
        self.feedPost = FeedPost(type: "  Medical Supplies .", title: title, body: body)
        postContainer.addSubview(avatar)
        postContainer.addSubview(feedPost)
        // Do any additional setup after loading the view.
}
    override func viewDidLayoutSubviews() {
//        avatar.draw(CGRect.zero)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
