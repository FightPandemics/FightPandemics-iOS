//
//  OpenSourceCreditsViewController.swift
//  FightPandemics
//
//  Created by Harlan Kellaway on 5/18/20.
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

final class OpenSourceCreditsViewController: UITableViewController {

    // MARK: - Properties

    var api: API!
    var navigator: Navigator!

    private var downloadedLicenses: [(license: OpenSourceLicense, details: HTML)] = []
    private var loadingSpinner = UIActivityIndicatorView(style: .medium)

    // MARK: - Overrides

    // MARK: View life-cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(OpenSourceTableViewCell.self,
                           forCellReuseIdentifier: OpenSourceTableViewCell.reuseIdentifier)
        setupUI()
        downloadLicenses()
    }

    // MARK: - Instance methods

    // MARK: Private instance methods

    private func downloadLicenses() {
        loadingSpinner.startAnimating()
        api.downloadOpenSourceLicenses { [weak self] downloadedLicenses in
            self?.downloadedLicenses = downloadedLicenses
            self?.loadingSpinner.stopAnimating()
            self?.tableView.reloadData()
        }
    }

    private func setupUI() {
        self.title = "OpenSourceCreditsTitle".localized
        loadingSpinner.makeSubview(of: view)
            .center()
    }

}

// MARK: - Protocol conformance

// MARK: UITableViewDataSource

extension OpenSourceCreditsViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return downloadedLicenses.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable:next force_cast
        let cell: OpenSourceTableViewCell = tableView.dequeueReusableCell(withIdentifier: OpenSourceTableViewCell.reuseIdentifier) as! OpenSourceTableViewCell
        let license = downloadedLicenses[indexPath.row]
        cell.configure(license: license)
        return cell
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
