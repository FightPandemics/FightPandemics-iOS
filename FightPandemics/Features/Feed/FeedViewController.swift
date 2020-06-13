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
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private let feedMenuBar = FeedMenuBar()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        return collectionView
    }()

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let xContentOffset = scrollView.contentOffset.x / 3
        feedMenuBar.horizontalBarViewLeftConstraint?.constant = xContentOffset
    }

    func scrollViewWillEndDragging(_: UIScrollView, withVelocity _: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = Int(targetContentOffset.pointee.x / view.frame.width)
        let indexPath = IndexPath(row: index, section: 0)
        feedMenuBar.menuCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .left)
    }

    func scrollToMenuItem(at index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
    }
}

private extension FeedViewController {
    func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9647058824, blue: 0.9843137255, alpha: 1)
        feedMenuBar.feedViewController = self
        feedMenuBar.makeSubview(of: view)
            .top(to: \.safeAreaLayoutGuide.topAnchor)
            .width(to: \.widthAnchor)
            .height(57)

        collectionView.register(FeedViewCell.self, forCellWithReuseIdentifier: FeedViewCell.reuseIdentifier)
        collectionView.makeSubview(of: view)
            .top(to: \.bottomAnchor, of: feedMenuBar, relation: .equal, constant: 8, priority: .required)
            .leading(to: \.leadingAnchor)
            .trailing(to: \.trailingAnchor)
            .bottom(to: \.bottomAnchor)
    }
}

extension FeedViewController: UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedViewCell.reuseIdentifier, for: indexPath) as? FeedViewCell else {
            return UICollectionViewCell()
        }

        if indexPath.row == 0 {
            cell.backgroundColor = .orange
        } else if indexPath.row == 1 {
            cell.backgroundColor = .green
        } else {
            cell.backgroundColor = .purple
        }
        return cell
    }
}

extension FeedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.width
        return CGSize(width: width, height: height)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumLineSpacingForSectionAt _: Int) -> CGFloat {
        return 0
    }
}
