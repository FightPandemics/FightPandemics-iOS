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

/// Performs all navigation between screens.
final class Navigator {
    // MARK: - Properties

    private var rootWindow: UIWindow?
    private var rootTabBar: RootTabBarController?
    private var logInNavigationController: UINavigationController?
    private var feedNavigationController: RootNavigationController?
    private var searchNavigationController: RootNavigationController?
    private var inboxNavigationController: RootNavigationController?
    private var profileNavigationController: RootNavigationController?
    private var presentedBottomModal: BottomModal?

    private let api: API
    private let autoLoginFakeLaunchScreen: AutoLoginFakeLaunchScreen
    private let locationServices: LocationServices
    private let sessionManager: SessionManager

    // MARK: - Init/Deinit

    init(rootWindow: UIWindow?, api: API,
         autoLoginFakeLaunchScreen: AutoLoginFakeLaunchScreen,
         locationServices: LocationServices,
         sessionManager: SessionManager) {
        self.rootWindow = rootWindow
        self.api = api
        self.autoLoginFakeLaunchScreen = autoLoginFakeLaunchScreen
        self.locationServices = locationServices
        self.sessionManager = sessionManager
    }

    // MARK: - Instance methods

    func installRootTabBar() {
        rootWindow?.rootViewController = rootTabBarController()
    }

    func navigateToLogIn() {
        let logIn = logInNavController()
        logIn.modalPresentationStyle = .overFullScreen

        // Slight delay to give initial UI time to setup in the event Log In presented right at launch
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

    func navigateToFiltersModal() {
        guard let rootTabBar = rootTabBar else { return }

        let bottomModal = BottomModal(body: filtersModal(),
                                      height: 307)
        presentedBottomModal = bottomModal
        bottomModal.present(on: rootTabBar)
    }

    func dismissFiltersModal() {
        presentedBottomModal?.dismiss { [weak self] in
            self?.presentedBottomModal = nil
        }
    }

    func navigateToCreatePostEntitySelectionModal() {
        guard let rootTabBar = rootTabBar else { return }

        let bottomModal = BottomModal(body: createPostEntitySelectionModal(),
                                      height: 332)
        presentedBottomModal = bottomModal
        bottomModal.present(on: rootTabBar)
    }

    func dismissCreatePostEntitySelectionModal(then: @escaping () -> Void) {
        presentedBottomModal?.dismiss { [weak self] in
            then()
            self?.presentedBottomModal = nil
        }
    }

    func navigateToCreatePost(postingEntity: Entity) {
        rootTabBar?.present(createPostViewController(postingEntity: postingEntity),
                            animated: true,
                            completion: nil)
    }

    func dismissCreatePost() {
        rootTabBar?.dismiss(animated: true, completion: nil)
    }

    func navigateToOpenSourceCredits() {
        profileNavigationController?.pushViewController(openSourceCreditsViewController(), animated: true)
    }

    // MARK: Private instance methods

    private func rootTabBarController() -> RootTabBarController {
        let rootTabBarController = StoryboardScene.Main.rootTabBarController.instantiate()
        rootTabBar = rootTabBarController
        rootTabBarController.autoLoginFakeLaunchScreen = autoLoginFakeLaunchScreen
        rootTabBarController.navigator = self
        rootTabBarController.sessionManager = sessionManager
        let feedNavigationController = rootTabBarController.navController(.feed)
        self.feedNavigationController = feedNavigationController
        feedNavigationController?.navigator = self
        feedNavigationController?.pushViewController(feedViewController(), animated: false)
        let searchNavigationController = rootTabBarController.navController(.search)
        self.searchNavigationController = searchNavigationController
        searchNavigationController?.navigator = self
        searchNavigationController?.pushViewController(searchViewController(), animated: false)
        let inboxNavigationController = rootTabBarController.navController(.inbox)
        self.inboxNavigationController = inboxNavigationController
        inboxNavigationController?.navigator = self
        inboxNavigationController?.pushViewController(inboxViewController(), animated: false)
        let profileNavigationController = rootTabBarController.navController(.profile)
        self.profileNavigationController = profileNavigationController
        profileNavigationController?.navigator = self
        profileNavigationController?.pushViewController(profileViewController(), animated: false)
        return rootTabBarController
    }

    private func filtersModal() -> FiltersModal {
        let filtersModal = StoryboardScene.Filters.filtersModal.instantiate()
        filtersModal.navigator = self
        return filtersModal
    }

    private func feedViewController() -> FeedViewController {
        let feedViewController = StoryboardScene.Feed.feedViewController.instantiate()
        return feedViewController
    }

    private func searchViewController() -> SearchViewController {
        let searchViewController = StoryboardScene.Search.searchViewController.instantiate()
        return searchViewController
    }

    private func createPostEntitySelectionModal() -> CreatePostEntitySelectionModal {
        let createPostModal = StoryboardScene.Post.createPostEntitySelectionModal.instantiate()
        createPostModal.navigator = self
        return createPostModal
    }

    private func createPostViewController(postingEntity: Entity) -> CreatePostViewController {
        let createPostViewController = StoryboardScene.Post.createPostViewController.instantiate()
        createPostViewController.postingEntity = postingEntity
        createPostViewController.navigator = self
        return createPostViewController
    }

    private func inboxViewController() -> InboxViewController {
        let inboxViewController = StoryboardScene.Inbox.inboxViewController.instantiate()
        return inboxViewController
    }

    private func profileViewController() -> ProfileViewController {
        let profileViewController = StoryboardScene.Profile.profileViewController.instantiate()
        profileViewController.navigator = self
        profileViewController.sessionManager = sessionManager
        return profileViewController
    }

    private func openSourceCreditsViewController() -> OpenSourceCreditsViewController {
        let openSourceCreditsViewController = StoryboardScene.Profile.openSourceCreditsViewController.instantiate()
        openSourceCreditsViewController.api = api
        openSourceCreditsViewController.navigator = self
        return openSourceCreditsViewController
    }

    private func logInNavController() -> UINavigationController {
        let logInNavigationController = StoryboardScene.Auth.logInNavigationController.instantiate()
        self.logInNavigationController = logInNavigationController
        logInNavigationController.pushViewController(logInViewController(), animated: false)
        return logInNavigationController
    }

    private func logInViewController() -> LogInViewController {
        let logInViewController = StoryboardScene.Auth.logInViewController.instantiate()
        logInViewController.navigator = self
        logInViewController.sessionManager = sessionManager
        return logInViewController
    }
}
