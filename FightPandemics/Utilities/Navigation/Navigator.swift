//
//  Navigator.swift
//  FightPandemics
//
//  Created by Harlan Kellaway on 5/10/20.
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

// swiftlint:disable force_cast

/// Performs all navigation between screens.
final class Navigator {

    // MARK: - Properties

    /// Root window of application.
    private(set) var rootWindow: UIWindow?

    private var homeNavigationController: UINavigationController?

    // MARK: - Init/Deinit

    init(rootWindow: UIWindow?) {
        self.rootWindow = rootWindow
    }

    // MARK: - Instance methods

    func installRootView() {
        rootWindow?.rootViewController = rootTabBarController()
    }

    private func rootTabBarController() -> RootTabBarController {
        let rootTabBarController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "RootTabBarController") as! RootTabBarController
        let homeTab = rootNavController(from: HomeViewController.self, storyboardName: "Home", localizedTabBarTitleKey: "Home")
        self.homeNavigationController = homeTab
        rootTabBarController.viewControllers = [homeTab]
        return rootTabBarController
    }

    private func rootNavController<T: UIViewController>(from: T.Type,
                                                        storyboardName: String,
                                                        localizedTabBarTitleKey: String) -> UINavigationController {
        let identifier = String(describing: T.self)
        let navigationController = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: "\(storyboardName)NavigationController") as! UINavigationController
        let controller = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: identifier) as! T
        navigationController.pushViewController(controller, animated: false)
        navigationController.tabBarItem.title = NSLocalizedString(localizedTabBarTitleKey, comment: "")
        return navigationController
    }

}
