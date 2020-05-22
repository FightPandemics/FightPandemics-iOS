//
//  ProfileViewController.swift
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

final class ProfileViewController: UIViewController {
    // MARK: - Properties

    var navigator: Navigator!
    var sessionManager: SessionManager!

    private var button = UIButton()
    private var logOutButton = UIButton()

    // MARK: - Overrides

    // MARK: View life-cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    // MARK: - Instance methods

    // MARK: Private instance methods

    private func setupUI() {
        logOutButton.makeSubview(of: view)
            .top(to: \.topAnchor, constant: 120)
            .leading(to: \.leadingAnchor, constant: 8)
            .height(30)
        logOutButton.setTitle("LogOutCTA".localized, for: .normal)
        logOutButton.setTitleColor(.black, for: .normal)
        logOutButton.addTarget(self, action: #selector(logOut), for: .touchUpInside)

        button.makeSubview(of: view)
            .center()
            .width(100)
            .height(50)
        button.backgroundColor = .systemBlue
        button.setTitle("OSS", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(oss), for: .touchUpInside)
    }

    @objc private func oss() {
        navigator.navigateToOpenSourceCredits()
    }

    @objc private func logOut() {
        sessionManager.logOut()
        navigator.navigateToLogIn()
    }
}
