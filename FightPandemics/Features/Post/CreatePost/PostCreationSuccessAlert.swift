//
//  PostCreationSuccessAlert.swift
//  FightPandemics
//
//  Created by Onyekachi Ezeoke on 29/05/2020.
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

class PostCreationSuccessAlert: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    private struct Dimension {
        static let viewPostButtonHeight: CGFloat = 48
    }

    static let shared = PostCreationSuccessAlert()

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let containerView = UIView()
    private let imageView = UIImageView(image: #imageLiteral(resourceName: "connectivity"))
    private let titleLabel = UILabel()
    private let messageLabel = UILabel()
    private let viewPostButton = UIButton()

    private func setupViews() {
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2727686216)
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true

        imageView.contentMode = .scaleAspectFill

        titleLabel.textColor = #colorLiteral(red: 0.1568627451, green: 0.1568627451, blue: 0.1568627451, alpha: 1)
        titleLabel.font = Fonts.poppinsBold.customFont(size: 16)

        messageLabel.textColor = #colorLiteral(red: 0.1568627451, green: 0.1568627451, blue: 0.1568627451, alpha: 1)
        messageLabel.textAlignment = .center
        messageLabel.font = Fonts.worksansRegular.customFont(size: 12)
        messageLabel.numberOfLines = 0

        viewPostButton.backgroundColor = #colorLiteral(red: 0.2588235294, green: 0.3529411765, blue: 0.9490196078, alpha: 1)
        viewPostButton.layer.cornerRadius = Dimension.viewPostButtonHeight / 2
        viewPostButton.layer.masksToBounds = true
        viewPostButton.setTitle("PostCreationAlertButtonTitle".localized, for: .normal)
        viewPostButton.titleLabel?.font = Fonts.poppinsMedium.customFont(size: 14)
        viewPostButton.addTarget(self, action: #selector(viewPostButtonPressed), for: .touchUpInside)

        addViewConstraints()
    }

    private func addViewConstraints() {
        containerView.makeSubview(of: self)
            .centerX(to: \.centerXAnchor)
            .centerY(to: \.centerYAnchor)
            .width(to: \.widthAnchor, multiplier: 0.877)
            .height(to: \.heightAnchor, multiplier: 0.42)

        imageView.makeSubview(of: containerView)
            .top(to: \.topAnchor, constant: 37)
            .left(to: \.leftAnchor, constant: 52)
            .right(to: \.rightAnchor, constant: -52)
            .height(119)

        titleLabel.makeSubview(of: containerView)
            .top(to: \.bottomAnchor, of: imageView, relation: .equal, constant: 20, priority: .required)
            .centerX(to: \.centerXAnchor)

        messageLabel.makeSubview(of: containerView)
            .top(to: \.bottomAnchor, of: titleLabel, relation: .equal, constant: 22, priority: .required)
            .leading(to: \.leadingAnchor, constant: 26)
            .trailing(to: \.trailingAnchor, constant: -26)

        viewPostButton.makeSubview(of: containerView)
            .top(to: \.bottomAnchor, of: messageLabel, relation: .equal, constant: 20, priority: .required)
            .centerX(to: \.centerXAnchor)
            .height(Dimension.viewPostButtonHeight)
            .width(to: \.widthAnchor, multiplier: 0.538)
    }

    func showAlert(with title: String? = nil, message: String? = nil) {
        titleLabel.text = title ?? "PostCreationAlertTitle".localized
        messageLabel.text = message ?? "PostCreationAlertMessage".localized

        frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        let keyWindow = UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .map { $0 as? UIWindowScene }
            .compactMap { $0 }
            .first?.windows
            .filter { $0.isKeyWindow }.first
        keyWindow?.addSubview(self)
    }

    @objc private func viewPostButtonPressed(_: UIButton) {
        removeFromSuperview()
    }
}
