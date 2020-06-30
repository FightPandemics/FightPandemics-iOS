//
//  FeedViewCell.swift
//  FightPandemics
//
//  Created by Onyekachi Ezeoke on 03/06/2020.
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

class FeedViewCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: self)

    var characters = ["Link", "Zelda", "Ganondorf", "Midna"]

    // The Offer Request Card (Feed)
    let offerReqCard = OfferRequestCard(headerData: .init(postedDate: "P", reqOrOffer: "O", supplyType: "M"), subHeaderData: .init(initials: "AM", name: "Ana Muller", location: "Berlin, Germany"), bodyData: .init(tit: "I", message: "E"), footerData: .init(numOfLikes: 4, numOfComments: 7))

    let postCardTableView = UITableView()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        // Offer Request Card Constraints
        offerReqCard.makeSubview(of: contentView)
            .top(to: \.topAnchor, constant: 20)
            .left(to: \.leftAnchor, constant: 20)
            .right(to: \.rightAnchor, constant: -20)
            .width(UIScreen.main.bounds.width)
            .height(400)
    }
}

extension FeedViewCell: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = characters[indexPath.row]
        return cell
    }
}
