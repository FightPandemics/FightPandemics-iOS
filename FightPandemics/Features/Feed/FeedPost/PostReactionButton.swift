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
    case comments
    case send
}

class PostReactionButton: UIButton {
    private var type: PostReactionButtonType

    var count: Int? {
        didSet {
            if let count = count, type == .like || type == .comments {
                setTitle(String(count), for: .normal)
            }
        }
    }

    init(type: PostReactionButtonType) {
        self.type = type
        super.init(frame: .zero)
        configureButton()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func tap() {
        isSelected.toggle()
    }

    private func configureButton() {
        imageView?.contentMode = .scaleAspectFit
        switch type {
        case .like:
            setImage(#imageLiteral(resourceName: "heart"), for: .normal)
            setImage(#imageLiteral(resourceName: "heart_filled"), for: .selected)
        case .comments:
            setImage(#imageLiteral(resourceName: "message-square"), for: .normal)
        case .send:
            setImage(#imageLiteral(resourceName: "send"), for: .normal)
        }
        addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
}
