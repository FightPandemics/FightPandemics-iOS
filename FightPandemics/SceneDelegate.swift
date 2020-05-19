//
//  SceneDelegate.swift
//  FightPandemics
//
//  Created by Andreas Ink on 4/28/20.
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

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private(set) var currentEnvironment: Environment!
    private(set) var navigator: Navigator!

    func scene(_ scene: UIScene,
               willConnectTo _: UISceneSession,
               options _: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window`
        // to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new
        // (see `application:configurationForConnectingSceneSession` instead).
        // swiftlint:disable:next unused_optional_binding
        guard let _ = (scene as? UIWindowScene) else { return }

        #if RELEASE
            currentEnvironment = .production
        #else
            currentEnvironment = .mock
        #endif

        setupDependencies()
        navigator.installRootTabBar()
    }

    private func setupDependencies() {
        let api: API
        switch currentEnvironment! {
        case .production:
            api = FightPandemicsAPI(baseURL: "https://api.fightpandemics.com",
                                    httpClient: HTTPClient(),
                                    jsonFileReader: JSONFileReader())
        case .staging:
            api = FightPandemicsAPI(baseURL: "https://staging-api.fightpandemics.com",
                                    httpClient: HTTPClient(),
                                    jsonFileReader: JSONFileReader())
        case .mock:
            let wrappedAPI = FightPandemicsAPI(baseURL: "",
                                               httpClient: HTTPClient(),
                                               jsonFileReader: JSONFileReader())
            api = MockAPI(realAPI: wrappedAPI)
        }

        let autoLoginFakeLaunchScreen = AutoLoginFakeLaunchScreen(rootWindow: window)
        let sessionManager = SessionManager(api: api, authState: .guest)
        navigator = Navigator(rootWindow: window,
                              api: api,
                              autoLoginFakeLaunchScreen: autoLoginFakeLaunchScreen,
                              sessionManager: sessionManager)
    }

    func sceneDidDisconnect(_: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded
        // (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}
