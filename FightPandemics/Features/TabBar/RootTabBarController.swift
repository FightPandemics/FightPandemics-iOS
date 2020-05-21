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
        case inbox = 2
        case profile = 3
    }

    // MARK: - Properties

    var autoLoginFakeLaunchScreen: AutoLoginFakeLaunchScreen!
    var navigator: Navigator!
    var sessionManager: SessionManager!

    private var postButton: UIButton!

    // MARK: - Overrides

    // MARK: View life-cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        customizeTabBar()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        attemptAutoLogIn()
    }

    // MARK: - Instance methods

    func selectTab(_ tab: Tab) {
        switch tab {
        case .feed, .search, .profile, .inbox:
            selectedIndex = tab.rawValue

            guard let item = tabBarItem(tab) else { return }
            item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .selected)
            tabBar.tintColor = .black
            let itemView = item.value(forKey: "view") as? UIView
            var addend = CGFloat()
            if tabBar.items?.firstIndex(of: item) == 0 {
                addend = -19
            } else if tabBar.items?.firstIndex(of: item) == 1 {
                addend = -35
            } else if tabBar.items?.firstIndex(of: item) == 2 {
                addend = 27
            } else if tabBar.items?.firstIndex(of: item) == 3 {
                addend = 12
            }
            let dotView = UIView()
            if tabBar.viewWithTag(100) != nil {
                tabBar.viewWithTag(100)?.removeFromSuperview()
            }
            dotView.backgroundColor = UIColor.fightPandemicsNeonBlue()
            dotView.tag = 100
            dotView.frame.size = CGSize(width: 6, height: 6)
            dotView.layer.cornerRadius = 3
            dotView.layer.masksToBounds = true
            dotView.frame.origin.x = (itemView?.frame.origin.x)! + ((itemView?.frame.size.width)! / 2) + addend
            dotView.frame.origin.y = 40
            tabBar.addSubview(dotView)
            tabBar.layoutIfNeeded()
            tabBar.layoutSubviews()
            tabBar.bringSubviewToFront(postButton)
        case .post:
            selectPostTab()
        }
    }

    func tabBarItem(_ tab: Tab) -> UITabBarItem? {
        assert(tab.rawValue >= 0 && tab.rawValue <= Tab.allCases.count - 1, "Invalid Tab index")
        return tabBar.items?[tab.rawValue]
    }

    func navController(_ tab: Tab) -> RootNavigationController? {
        assert(tab.rawValue >= 0 && tab.rawValue <= Tab.allCases.count - 1, "Invalid Tab index")
        return viewControllers?[tab.rawValue] as? RootNavigationController
    }

    // MARK: Private instance methods

    private func customizeTabBar() {
        guard let feedTabBarItem = tabBarItem(.feed),
            let searchTabBarItem = tabBarItem(.search),
            let inboxTabBarItem = tabBarItem(.inbox),
            let profileTabBarItem = tabBarItem(.profile) else {
            return
        }

        tabBarInitialSetUp()

        feedTabBarItem.image = UIImage(named: "feed")
        searchTabBarItem.image = UIImage(named: "search")
        inboxTabBarItem.image = UIImage(named: "inbox")
        profileTabBarItem.image = UIImage(named: "profile")

        feedTabBarItem.title = "TabBarFeedBtn".localized
        searchTabBarItem.title = "TabBarSearchBtn".localized
        inboxTabBarItem.title = "TabBarInboxBtn".localized
        profileTabBarItem.title = "TabBarProfileBtn".localized

        feedTabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 12)], for: .normal)
        searchTabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 12)], for: .normal)
        inboxTabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 12)], for: .normal)
        profileTabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 12)], for: .normal)

        feedTabBarItem.titlePositionAdjustment = UIOffset(horizontal: -15, vertical: 0)
        searchTabBarItem.titlePositionAdjustment = UIOffset(horizontal: -30, vertical: 0)
        inboxTabBarItem.titlePositionAdjustment = UIOffset(horizontal: 30, vertical: 0)
        profileTabBarItem.titlePositionAdjustment = UIOffset(horizontal: 15, vertical: 0)

        let postButton = UIButton()
        self.postButton = postButton
        postButton.frame.size = CGSize(width: 44, height: 44)
        postButton.setImage(UIImage(named: "post"), for: .normal)
        postButton.center = CGPoint(x: tabBar.frame.width / 2, y: 24)
        tabBar.addSubview(postButton)
        postButton.addTarget(self, action: #selector(selectPostTab), for: .touchUpInside)
        tabBar.bringSubviewToFront(postButton)
    }

    private func tabBarInitialSetUp() {
        tabBar.tintColor = .black
        tabBar.items?[0].setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .selected)
        tabBar.barTintColor = .white
        tabBar.backgroundImage = UIImage()
        tabBar.backgroundColor = .white
        tabBar.clipsToBounds = true
        tabBar.layer.cornerRadius = 10
        tabBar.layer.masksToBounds = true
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowRadius = 8
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.borderWidth = 0
        tabBar.shadowImage = UIImage()
        let itemView = tabBar.items?[0].value(forKey: "view") as? UIView
        let dotView = UIView()
        dotView.backgroundColor = UIColor.fightPandemicsNeonBlue()
        dotView.tag = 100
        dotView.frame.size.width = 6
        dotView.frame.size.height = 6
        dotView.layer.cornerRadius = 3
        dotView.layer.masksToBounds = true
        dotView.frame.origin.x = ((itemView?.frame.size.width)! / 2) - 18
        dotView.frame.origin.y = 40
        tabBar.addSubview(dotView)
    }

    @objc private func selectPostTab() {
        navigator.navigateToCreatePostEntitySelectionModal()
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
    func tabBarController(_: UITabBarController, didSelect viewController: UIViewController) {
        guard let viewController = (viewController as? RootNavigationController)?.viewControllers.first else {
            return
        }

        let tab: Tab
        switch viewController {
        case is FeedViewController:
            tab = .feed
        case is SearchViewController:
            tab = .search
        case is InboxViewController:
            tab = .inbox
        case is ProfileViewController:
            tab = .profile
        default:
            return
        }

        selectTab(tab)
    }
}
