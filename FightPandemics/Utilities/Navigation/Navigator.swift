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

    private let sessionManager: SessionManager

    private var rootWindow: UIWindow?
    private var rootTabBar: RootTabBarController?
    private var logInNavigationController: UINavigationController?
    private var feedNavigationController: UINavigationController?
    private var searchNavigationController: UINavigationController?
    private var profileNavigationController: UINavigationController?

    // MARK: - Init/Deinit

    init(rootWindow: UIWindow?, sessionManager: SessionManager) {
        self.rootWindow = rootWindow
        self.sessionManager = sessionManager
    }

    // MARK: - Instance methods

    func installRootTabBar() {
        rootWindow?.rootViewController = rootTabBarController()
    }

    func navigateToLogIn() {
        // Can be displayed at launch; slignt delay to give initial UI time to setup
        let logIn = logInNavController()
        logIn.modalPresentationStyle = .overFullScreen
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            self?.rootTabBar?.present(logIn, animated: true, completion: nil)
            self?.rootTabBar?.selectTab(.feed)
        }
    }

    func dismissLogIn() {
        rootTabBar?.dismiss(animated: true) { [weak self] in
            self?.logInNavigationController = nil
        }
    }

    // MARK: Private instance methods

    private func rootTabBarController() -> RootTabBarController {
        let rootTabBarController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "RootTabBarController") as! RootTabBarController
        self.rootTabBar = rootTabBarController
        rootTabBarController.navigator = self
        rootTabBarController.sessionManager = sessionManager
        let feedNavigationController = rootTabBarController.navController(.feed)
        self.feedNavigationController = feedNavigationController
        feedNavigationController?.pushViewController(feedViewController(), animated: false)
        let searchNavigationController = rootTabBarController.navController(.search)
        self.searchNavigationController = searchNavigationController
        searchNavigationController?.pushViewController(searchViewController(), animated: false)
        let profileNavigationController = rootTabBarController.navController(.profile)
        self.profileNavigationController = profileNavigationController
        profileNavigationController?.pushViewController(profileViewController(), animated: false)
        return rootTabBarController
    }

    private func feedViewController() -> FeedViewController {
        let feedViewController = UIStoryboard(name: "Feed", bundle: nil)
            .instantiateViewController(withIdentifier: "FeedViewController") as! FeedViewController
        return feedViewController
    }

    private func searchViewController() -> SearchViewController {
        let searchViewController = UIStoryboard(name: "Search", bundle: nil)
            .instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        return searchViewController
    }

    private func profileViewController() -> ProfileViewController {
        let profileViewController = UIStoryboard(name: "Profile", bundle: nil)
            .instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        profileViewController.navigator = self
        profileViewController.sessionManager = sessionManager
        return profileViewController
    }

    private func logInNavController() -> UINavigationController {
        let logInNavigationController = UIStoryboard(name: "Auth", bundle: nil)
            .instantiateViewController(withIdentifier: "LogInNavigationController") as! UINavigationController
        self.logInNavigationController = logInNavigationController
        logInNavigationController.pushViewController(logInViewController(), animated: false)
        return logInNavigationController
    }

    private func logInViewController() -> LogInViewController {
        let logInViewController = UIStoryboard(name: "Auth", bundle: nil)
            .instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
        logInViewController.navigator = self
        return logInViewController
    }

}
