//
//  LogInViewController.swift
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

final class LogInViewController: UIViewController {
    // MARK: - Properties

    var navigator: Navigator!
    var sessionManager: SessionManager!

    private var loadingSpinner = UIActivityIndicatorView()

    // MARK: - Overrides

    // MARK: View life-cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    // MARK: - Instance methods

    // MARK: Private instance methods

    private func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "LogInCTA".localized,
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(logIn))
        title = "Tap Log In >>>"
        view.backgroundColor = .systemTeal

        loadingSpinner.color = .white
        loadingSpinner.makeSubview(of: view)
            .center()
    }

    @objc private func logIn() {
        loadingSpinner.startAnimating()
        disableForm()
        sessionManager.logIn(email: "lily@luke.co", password: "Pass123") { [weak self] result in
            self?.loadingSpinner.stopAnimating()
            self?.enableForm()

            switch result {
            case .success:
                self?.navigator.dismissLogIn()
            case let .failure(error):
                // TODO: Error handling
                print(error)
            }
        }
    }

    private func enableForm() {
        navigationItem.rightBarButtonItem?.isEnabled = true
    }

    private func disableForm() {
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
}
