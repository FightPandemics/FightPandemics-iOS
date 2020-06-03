//
//  FeedMenuBar.swift
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

class FeedMenuBar: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    weak var feedViewController: FeedViewController?

    private let menuOptions = ["FeedMenuAllTitle", "FeedMenuOffersTitle", "FeedMenuRequestsTitle"]

    lazy var menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    private let horizontalBarView = UIView()
    var horizontalBarViewLeftConstraint: NSLayoutConstraint?
}

private extension FeedMenuBar {
    func setupViews() {
        backgroundColor = .white
        menuCollectionView.register(FeedMenuCell.self, forCellWithReuseIdentifier: FeedMenuCell.reuseIdentifier)

        let selectedIndex = IndexPath(row: 0, section: 0)
        menuCollectionView.selectItem(at: selectedIndex, animated: false, scrollPosition: .left)

        menuCollectionView.makeSubview(of: self)
            .pinToEdges()

        horizontalBarView.backgroundColor = UIColor.fightPandemicsNeonBlue()
        horizontalBarView.makeSubview(of: self)
            .bottom(to: \.bottomAnchor)
            .height(2)
            .width(to: \.widthAnchor, multiplier: 1 / 3)

        horizontalBarViewLeftConstraint = horizontalBarView.leftAnchor.constraint(equalTo: leftAnchor)
        horizontalBarViewLeftConstraint?.isActive = true
    }
}

extension FeedMenuBar: UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return menuOptions.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedMenuCell.reuseIdentifier, for: indexPath) as? FeedMenuCell else {
            return UICollectionViewCell()
        }
        let text = menuOptions[indexPath.row]
        cell.updateLabel(with: text.localized)
        return cell
    }
}

extension FeedMenuBar: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        feedViewController?.scrollToMenuItem(at: indexPath.row)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 3, height: frame.height)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumInteritemSpacingForSectionAt _: Int) -> CGFloat {
        return 0
    }
}
