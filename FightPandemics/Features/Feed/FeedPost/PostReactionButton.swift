//
//  FPPostButton.swift
//  FightPandemics
//
//  Created by Onyekachi Ezeoke on 15/05/2020.
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

enum PostReactionButtonType {
    case like
    case message
    case send
}

class PostReactionButton: UIButton {
    private var type: PostReactionButtonType

    init(_ type: PostReactionButtonType) {
        self.type = type
        super.init(frame: .zero)
        configureButton()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var count: Int? {
        didSet {
            if let count = count, type == .like || type == .message {
                setTitle(String(count), for: .normal)
            }
        }
    }

    @objc func tap() {
        isSelected = !isSelected
    }

    private func configureButton() {
        translatesAutoresizingMaskIntoConstraints = false
        let rightPadding: CGFloat
        imageView?.contentMode = .scaleAspectFit
        switch type {
        case .like:
            rightPadding = 9.8
            setImage(#imageLiteral(resourceName: "heart"), for: .normal)
            setImage(#imageLiteral(resourceName: "heart_filled"), for: .selected)
        case .message:
            rightPadding = 11.8
            setImage(#imageLiteral(resourceName: "message-square"), for: .normal)
        case .send:
            rightPadding = 0.0
            setImage(#imageLiteral(resourceName: "send"), for: .normal)
        }
        imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: rightPadding)
        titleLabel?.font = Fonts.poppinsRegular.customFont(size: 14)
        setTitleColor(#colorLiteral(red: 0.5764705882, green: 0.5764705882, blue: 0.5764705882, alpha: 1), for: .normal)
        addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
}
