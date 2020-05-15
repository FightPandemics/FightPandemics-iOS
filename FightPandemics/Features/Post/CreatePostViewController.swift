//
//  CreatePostViewController.swift
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

class CreatePostViewController: UIViewController {

    var navigator: Navigator!

    private var feedPost = FeedPost()
    private var postFooter = PostFooter()
    private var createPostHeader = CreatePostHeader()
    private var createPostBody = CreatePostBody()
    private var createPostFooter = CreatePostFooter()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

        self.createPostBody.setUp()
        self.createPostFooter.setUp()
        self.createPostHeader.setUp()
        self.createPostHeader.closeAction = { [weak self] in
            self?.navigator.dismissCreatePost()
        }

        let firstView = UIView()
        firstView.frame = CGRect(x: 0, y: 80, width: (UIScreen.main.bounds.width - 47), height: 400)
        self.view.addSubview(firstView)
        firstView.addSubview(createPostHeader)

        let secondView = UIView()
        secondView.frame = CGRect(x: 0, y: 243, width: (UIScreen.main.bounds.width - 47), height: 300)
        self.view.addSubview(secondView)
        secondView.addSubview(createPostBody)

        let thirdView = UIView()
        thirdView.frame = CGRect(x: 0, y: 530, width: (UIScreen.main.bounds.width - 47), height: 300)
        self.view.addSubview(thirdView)
        thirdView.addSubview(createPostFooter)
    }

}
