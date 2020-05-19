//
//  PostCreationTagView.swift
//  FightPandemics
//
//  Created by Onyekachi Ezeoke on 17/05/2020.
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

class PostCreationTagView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    private struct Dimension {
        static let buttonHeight: CGFloat = 44.2
        static let stackViewSpacing: CGFloat = 19
    }

    let mockTags = ["Medical supplies", "Groceries/Food", "Business", "Education", "Legal", "Wellbeing/Mental", "University", "Entertainment", "Information", "Funding", "R&D", "Tech", "Others"]

    private var tagCount: Int? {
        didSet {
             addTagButton.setTitle(addTagButtonTitle, for: .normal)
        }
    }

    private var addTagButtonTitle: String {
        let tagCount = self.tagCount ?? 0
        if tagCount == 0 {
            return "Tag-Button-With-Unselected-Tag".localized(formattedWith: String(tagCount))
        } else if tagCount == 1 {
            return "Tag-Btn-With-One-Selected-Tag".localized(formattedWith: String(tagCount))
        } else {
            return "Tag-Btn-With-Many-Selected-Tags".localized(formattedWith: String(tagCount))
        }
    }

    private lazy var addTagButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hexString: "#425AF2")
        button.layer.cornerRadius = Dimension.buttonHeight / 2
        button.layer.masksToBounds = true
        button.setTitle(addTagButtonTitle, for: .normal)
        button.titleLabel?.font = Fonts.poppinsRegular.customFont(size: 15)
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    private var closeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.borderColor = UIColor(hexString: "#425AF2").cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = Dimension.buttonHeight / 2
        button.layer.masksToBounds = true
        button.setTitle("CloseButton".localized, for: .normal)
        button.titleLabel?.font = Fonts.poppinsRegular.customFont(size: 15)
        button.setTitleColor(UIColor(hexString: "#425AF2"), for: .normal)
        return button
    }()

    private var headerLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.poppinsBold.customFont(size: 16)
        label.text = "Choose-Tags-Title".localized
        label.textColor = UIColor(hexString: "#282828")
        return label
    }()

    private let stackView = UIStackView()

    private lazy var tagsCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.register(PostTagCell.self, forCellWithReuseIdentifier: PostTagCell.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    private let topLiner = UIView()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PostCreationTagView {
    func setupViews() {
        stackView.addArrangedSubview(closeButton)
        stackView.addArrangedSubview(addTagButton)
        stackView.axis = .horizontal
        stackView.spacing = Dimension.stackViewSpacing
        stackView.distribution = .fillEqually

        topLiner.backgroundColor = UIColor(hexString: "#F3F4FE")
        topLiner.makeSubview(of: self)
            .top(to: \.topAnchor, constant: 10.8)
            .centerX(to: \.centerXAnchor)
            .width(to: \.widthAnchor, of: self, multiplier: 0.309, constant: 0, relation: .equal, priority: .required)
            .height(3.9)

        headerLabel.makeSubview(of: self)
            .top(to: \.bottomAnchor, of: topLiner, relation: .equal, constant: 25.3, priority: .required)
            .centerX(to: \.centerXAnchor)
            .height(22)

        tagsCollectionView.makeSubview(of: self)
            .top(to: \.bottomAnchor, of: headerLabel, relation: .equal, constant: 19, priority: .required)
            .height(to: \.heightAnchor, of: self, multiplier: 0.474, constant: 0, relation: .equal, priority: .required)
            .leading(to: \.leadingAnchor, constant: 23)
            .trailing(to: \.trailingAnchor, constant: -21)

        stackView.makeSubview(of: self)
            .top(to: \.bottomAnchor, of: tagsCollectionView, relation: .equal, constant: 35, priority: .required)
            .leading(to: \.leadingAnchor, of: nil, relation: .equal, constant: 22, priority: .required)
            .trailing(to: \.trailingAnchor, of: tagsCollectionView, relation: .equal, constant: -18, priority: .required)
            .height(44.2)
    }
}

extension PostCreationTagView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mockTags.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostTagCell.reuseIdentifier, for: indexPath) as? PostTagCell
            else { return UICollectionViewCell() }
        let tag = mockTags[indexPath.row]
        cell.updateLabel(with: tag)
        return cell

    }
}

extension PostCreationTagView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? PostTagCell
            else { return}
        if cell.backgroundColor == #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1) {
            cell.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9960784314, alpha: 1)
            cell.titleLabel.textColor = #colorLiteral(red: 0.2588235294, green: 0.3529411765, blue: 0.9490196078, alpha: 1)
            tagCount = (tagCount ?? 0) + 1
        } else {
            cell.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
            cell.titleLabel.textColor = #colorLiteral(red: 0.1568627451, green: 0.1568627451, blue: 0.1568627451, alpha: 1)
            tagCount = (tagCount ?? 0) - 1
        }
    }
}
