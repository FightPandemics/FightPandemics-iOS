//
//  AutoLogInFakeLaunchScreen.swift
//  FightPandemics
//
//  Created by Harlan Kellaway on 5/14/20.
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

/// View that fakes the appearance of the Launch Screen in order to perform Auto-Login.
final class AutoLoginFakeLaunchScreen {

    private let rootWindow: UIWindow?
    private let containerView = UIView()
    private let loadingSpinner = UIActivityIndicatorView(style: .medium)

    init(rootWindow: UIWindow?) {
        self.rootWindow = rootWindow
    }

    func show() {
        guard let rootView = rootWindow?.rootViewController?.view else {
            return
        }

        // TODO: UI should match Launch screen https://github.com/FightPandemics/FightPandemics-iOS/issues/52
        containerView.backgroundColor = .white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        rootView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: rootView.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: rootView.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: rootView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: rootView.bottomAnchor)
        ])

        loadingSpinner.color = .darkGray
        loadingSpinner.startAnimating()
        loadingSpinner.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(loadingSpinner)
        NSLayoutConstraint.activate([
            loadingSpinner.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            loadingSpinner.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }

    func dismiss() {
        UIView.animate(withDuration: 1.0, animations: { [weak self] in
            self?.containerView.alpha = 0.0
        }, completion: { [weak self] _ in
            self?.containerView.removeFromSuperview()
        })
    }

}