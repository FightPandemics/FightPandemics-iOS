//
//  FPPresentationControllerTransitioningDelegate.swift
//  FightPandemics
//
//  Created by Onyekachi Ezeoke on 16/05/2020.
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

// This is an illustration on how FPPresentationController class can be instantiated
// and used.
// For each view controller you want to customize to have a custom height,
// you have to create a class that conforms to UIViewControllerTransitioningDelegate and
// call the presentationController method. Put in the custom height as shown below
//
// Example on how to use this class is shown below:
//
// let viewControllerToPresent = ViewControllerToPresent()
// let transitioningDelegate = CustomTransitioningDelegate()
// viewControllerToPresent.view.backgroundColor = .green
// viewControllerToPresent.transitioningDelegate = transitioningDelegate
// viewControllerToPresent.modalPresentationStyle = .custom
// present(viewControllerToPresent, animated: true, completion: nil)

class CustomTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        FPPresentationController(presentedViewController: presented,
                                 presenting: presenting,
                                 height: 300)
    }
}
