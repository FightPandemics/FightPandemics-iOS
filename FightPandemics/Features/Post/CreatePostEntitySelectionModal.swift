//
//  CreatePostEntitySelectionModal.swift
//  FightPandemics
//
//  Created by Harlan Kellaway on 5/16/20.
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

final class CreatePostEntitySelectionModal: UIViewController {
    // MARK: - Properties

    var navigator: Navigator!

    private var confirmButton = UIButton()

    // MARK: - Overrides

    // MARK: View life-cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    // MARK: - Instance methods

    // MARK: Private instance methods

    private func setupUI() {
        confirmButton.backgroundColor = UIColor(hexString: "#425AF2")
        confirmButton.setTitle("IndividualOrgConfirmButton".localized, for: .normal)
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.makeSubview(of: view)
            .width(158)
            .height(44)
            .center()
        confirmButton.addTarget(self, action: #selector(confirmTapped), for: .touchUpInside)
    }

    @objc private func confirmTapped() {
        let mockOrganization = Organization(id: "123", name: "FightPandemics")
        navigator.dismissCreatePostEntitySelectionModal { [weak self] in
            self?.navigator.navigateToCreatePost(postingEntity: .organization(value: mockOrganization))
        }
    }
}
