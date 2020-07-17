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

class AllFeedScreen: BaseCell {
    lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()

    var dataSource: UICollectionViewDiffableDataSource<Section, Post>!
    private let refreshControl = UIRefreshControl()

    override func setupViews() {
        collectionView.register(cellType: FeedCell.self)
        collectionView.makeSubview(of: self)
            .top(to: \.topAnchor)
            .leading(to: \.leadingAnchor)
            .trailing(to: \.trailingAnchor)
            .bottom(to: \.bottomAnchor)

        dataSource = UICollectionViewDiffableDataSource<Section, Post>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, post) -> UICollectionViewCell? in

            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCell.reuseIdentifier, for: indexPath) as? FeedCell else {
                return UICollectionViewCell()
            }

            // TODO: The if statement will be removed later, it was added to visualize what we have currently
            if indexPath.item == 0 {
                cell.backgroundColor = .orange
            } else if indexPath.item == 1 {
                cell.backgroundColor = .blue
            } else if indexPath.item == 2 {
                cell.backgroundColor = .green
            }
            cell.post = post
            return cell
        })
        collectionView.dataSource = dataSource
        fetchPost()
        configureRefreshControl()
    }

    func fetchPost() {
        // TODO: The network call will happen here and the fetched post data will be appended to the snapshot
        let posts: [Post] = [.init(id: 1), .init(id: 2)]
        var snapShot = NSDiffableDataSourceSnapshot<Section, Post>()
        snapShot.appendSections([.main])
        snapShot.appendItems(posts)
        dataSource.apply(snapShot)
    }

    private func configureRefreshControl() {
        collectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshFeedData), for: .valueChanged)
    }

    @objc private func refreshFeedData() {
        // Call fetchPost() to fetch new data

        // Call this when the data has been fetched to stop the refresh animation
        DispatchQueue.main.async {
            self.refreshControl.endRefreshing()
        }
    }

    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(342))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
