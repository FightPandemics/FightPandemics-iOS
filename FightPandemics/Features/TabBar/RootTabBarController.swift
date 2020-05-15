//
//  RootTabBarController.swift
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

final class RootTabBarController: UITabBarController {

    // MARK: - Types

    enum Tab: Int, CaseIterable {
        case feed = 0
        case search = 1
        case post = -1 // Post tab not indexed through `viewControllers` array
        case profile = 2
        case menu = 3
    }

    // MARK: - Properties

    var autoLoginFakeLaunchScreen: AutoLoginFakeLaunchScreen!
    var navigator: Navigator!
    var sessionManager: SessionManager!

    // MARK: - Overrides

    // MARK: View life-cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        customizeTabBar()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        attemptAutoLogIn()
    }

    // MARK: - Instance methods

    func selectTab(_ tab: Tab) {
        switch tab {
        case .feed, .search, .profile:
            selectedIndex = tab.rawValue
        case .post:
            selectPostTab()
        case .menu:
            return
        }
    }

    func tabBarItem(_ tab: Tab) -> UITabBarItem? {
        assert(tab.rawValue >= 0 && tab.rawValue <= Tab.allCases.count - 2, "Invalid Tab index")
        return tabBar.items?[tab.rawValue]
    }

    func navController(_ tab: Tab) -> UINavigationController? {
        assert(tab.rawValue >= 0 && tab.rawValue <= Tab.allCases.count - 2, "Invalid Tab index")
        return viewControllers?[tab.rawValue] as? UINavigationController
    }

    // MARK: Private instance methods

    private func customizeTabBar() {
        guard let feedTabBarItem = tabBarItem(.feed),
            let searchTabBarItem = tabBarItem(.search),
            let profileTabBarItem = tabBarItem(.profile),
            let menuTabBarItem = tabBarItem(.menu) else {
            return
        }

        feedTabBarItem.image = UIImage(named: "logo")
        searchTabBarItem.image = UIImage(named: "logo")
        profileTabBarItem.image = UIImage(named: "logo")
        menuTabBarItem.image = UIImage(named: "logo")

        feedTabBarItem.titlePositionAdjustment = UIOffset(horizontal: -15, vertical: 0)
        searchTabBarItem.titlePositionAdjustment = UIOffset(horizontal: -20, vertical: 0)
        profileTabBarItem.titlePositionAdjustment = UIOffset(horizontal: 20, vertical: 0)
        menuTabBarItem.titlePositionAdjustment = UIOffset(horizontal: 15, vertical: 0)

        let postButton = UIButton()
        postButton.frame.size = CGSize(width: 44, height: 44)
        postButton.backgroundColor = UIColor(hexString: "#425AF2")
        postButton.layer.cornerRadius = 22
        postButton.layer.masksToBounds = true
        postButton.center = CGPoint(x: tabBar.frame.width / 2, y: 24)
        tabBar.addSubview(postButton)
        postButton.addTarget(self, action: #selector(selectPostTab), for: .touchUpInside)
    }

    @objc private func selectPostTab() {
//        navigator.navigateToCreatePost()
        navigator.navigateToFeedPrototype()
    }

    private func attemptAutoLogIn() {
        autoLoginFakeLaunchScreen.show()
        sessionManager.autoLogIn { [weak self] result in
            self?.autoLoginFakeLaunchScreen.dismiss()
            if !(result == .success) {
                self?.navigator.navigateToLogIn()
            }
        }
    }

}

// MARK: - Protocol conformance

// MARK: UITabBarControllerDelegate

extension RootTabBarController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is MenuViewController {
            return false
        }
        return true
    }

}
