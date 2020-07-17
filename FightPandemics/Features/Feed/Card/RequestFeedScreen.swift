//
//  RequestFeedScreen.swift
//  FightPandemics
//
//  Created by Onyekachi Ezeoke on 16/07/2020.
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

class RequestFeedScreen: AllFeedScreen {
    override func setupViews() {
        super.setupViews()
        fetchPost()
    }

    override func fetchPost() {
        // TODO: The network call will happen here and the fetched post data will be appended to the snapshot
        let posts: [Post] = [.init(id: 1)]
        var snapShot = NSDiffableDataSourceSnapshot<Section, Post>()
        snapShot.appendSections([.main])
        snapShot.appendItems(posts)
        dataSource.apply(snapShot)
    }
}
