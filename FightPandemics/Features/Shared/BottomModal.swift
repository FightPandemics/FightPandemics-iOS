//
//  BottomModal.swift
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

class BottomModal {

    let body: UIViewController
    let height: CGFloat

    private var presentingViewController: UIViewController?

    init(body: UIViewController, height: CGFloat) {
        self.body = body
        self.height = height
    }

    func show(on presentingViewController: UIViewController) {
        let transitioningDelegate = CustomTransitioningDelegate(height: height)
        body.view.backgroundColor = .white
        body.transitioningDelegate = transitioningDelegate
        body.modalPresentationStyle = .custom
        self.presentingViewController = presentingViewController
        presentingViewController.present(body, animated: true, completion: nil)
    }

    func dismiss(then: @escaping () -> Void) {
        presentingViewController?.dismiss(animated: true, completion: then)
    }

}
