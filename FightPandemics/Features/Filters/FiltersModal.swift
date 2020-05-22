//
//  FiltersModal.swift
//  FightPandemics
//
//  Created by Harlan Kellaway on 5/17/20.
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

final class FiltersModal: UIViewController {
    // MARK: - Properties

    var locationServices: LocationServices!
    var navigator: Navigator!

    private var locationServicesDeniedLabel = UILabel()

    // MARK: - Init/Deinit

    deinit {
        locationServices.removeObserver(self)
    }

    // MARK: - Overrides

    // MARK: View life-cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        locationServices.addObserver(self)
        locationServices.requestPermission()
    }

    // MARK: - Instance mtehods

    private func setupUI() {
        locationServicesDeniedLabel.numberOfLines = 0
        locationServicesDeniedLabel.textAlignment = .center
        locationServicesDeniedLabel.makeSubview(of: view)
            .center()
            .leading(to: \.leadingAnchor, constant: 8)
            .trailing(to: \.trailingAnchor, constant: -8)
        locationServicesDeniedLabel.text = "LocationServicesDeniedCTA".localized
        locationServicesDeniedLabel.isHidden = !locationServices.isPermissionDenied
    }
}

// MARK: - Protocol conformance

// MARK: LocationServicesObserver

extension FiltersModal: LocationServicesObserver {
    func locationServicesPermissionsDidChange() {
        locationServicesDeniedLabel.isHidden = !locationServices.isPermissionDenied
    }
}
