// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Storyboard Scenes

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
internal enum StoryboardScene {
    internal enum Auth: StoryboardType {
        internal static let storyboardName = "Auth"

        internal static let initialScene = InitialSceneType<UIKit.UINavigationController>(storyboard: Auth.self)

        internal static let logInNavigationController = SceneType<UIKit.UINavigationController>(storyboard: Auth.self, identifier: "LogInNavigationController")

        internal static let logInViewController = SceneType<FightPandemics.LogInViewController>(storyboard: Auth.self, identifier: "LogInViewController")
    }

    internal enum Feed: StoryboardType {
        internal static let storyboardName = "Feed"

        internal static let initialScene = InitialSceneType<FightPandemics.FeedViewController>(storyboard: Feed.self)

        internal static let feedViewController = SceneType<FightPandemics.FeedViewController>(storyboard: Feed.self, identifier: "FeedViewController")
    }

    internal enum Filters: StoryboardType {
        internal static let storyboardName = "Filters"

        internal static let initialScene = InitialSceneType<FightPandemics.FiltersModal>(storyboard: Filters.self)

        internal static let filtersModal = SceneType<FightPandemics.FiltersModal>(storyboard: Filters.self, identifier: "FiltersModal")
    }

    internal enum Inbox: StoryboardType {
        internal static let storyboardName = "Inbox"

        internal static let initialScene = InitialSceneType<FightPandemics.InboxViewController>(storyboard: Inbox.self)

        internal static let inboxViewController = SceneType<FightPandemics.InboxViewController>(storyboard: Inbox.self, identifier: "InboxViewController")
    }

    internal enum LaunchScreen: StoryboardType {
        internal static let storyboardName = "LaunchScreen"

        internal static let initialScene = InitialSceneType<UIKit.UIViewController>(storyboard: LaunchScreen.self)
    }

    internal enum Main: StoryboardType {
        internal static let storyboardName = "Main"

        internal static let initialScene = InitialSceneType<FightPandemics.RootTabBarController>(storyboard: Main.self)

        internal static let feedNavigationController = SceneType<FightPandemics.RootNavigationController>(storyboard: Main.self, identifier: "FeedNavigationController")

        internal static let menuRootNavigationController = SceneType<FightPandemics.RootNavigationController>(storyboard: Main.self, identifier: "MenuRootNavigationController")

        internal static let profileRootNavigationController = SceneType<FightPandemics.RootNavigationController>(storyboard: Main.self, identifier: "ProfileRootNavigationController")

        internal static let rootTabBarController = SceneType<FightPandemics.RootTabBarController>(storyboard: Main.self, identifier: "RootTabBarController")

        internal static let searchNavigationController = SceneType<FightPandemics.RootNavigationController>(storyboard: Main.self, identifier: "SearchNavigationController")
    }

    internal enum Post: StoryboardType {
        internal static let storyboardName = "Post"

        internal static let initialScene = InitialSceneType<FightPandemics.CreatePostViewController>(storyboard: Post.self)

        internal static let createPostEntitySelectionModal = SceneType<FightPandemics.CreatePostEntitySelectionModal>(storyboard: Post.self, identifier: "CreatePostEntitySelectionModal")

        internal static let createPostViewController = SceneType<FightPandemics.CreatePostViewController>(storyboard: Post.self, identifier: "CreatePostViewController")
    }

    internal enum Profile: StoryboardType {
        internal static let storyboardName = "Profile"

        internal static let initialScene = InitialSceneType<FightPandemics.ProfileViewController>(storyboard: Profile.self)

        internal static let openSourceCreditsViewController = SceneType<FightPandemics.OpenSourceCreditsViewController>(storyboard: Profile.self, identifier: "OpenSourceCreditsViewController")

        internal static let profileViewController = SceneType<FightPandemics.ProfileViewController>(storyboard: Profile.self, identifier: "ProfileViewController")
    }

    internal enum Search: StoryboardType {
        internal static let storyboardName = "Search"

        internal static let initialScene = InitialSceneType<FightPandemics.SearchViewController>(storyboard: Search.self)

        internal static let searchViewController = SceneType<FightPandemics.SearchViewController>(storyboard: Search.self, identifier: "SearchViewController")
    }
}

// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

// MARK: - Implementation Details

internal protocol StoryboardType {
    static var storyboardName: String { get }
}

internal extension StoryboardType {
    static var storyboard: UIStoryboard {
        let name = storyboardName
        return UIStoryboard(name: name, bundle: Bundle(for: BundleToken.self))
    }
}

internal struct SceneType<T: UIViewController> {
    internal let storyboard: StoryboardType.Type
    internal let identifier: String

    internal func instantiate() -> T {
        let identifier = self.identifier
        guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
        }
        return controller
    }
}

internal struct InitialSceneType<T: UIViewController> {
    internal let storyboard: StoryboardType.Type

    internal func instantiate() -> T {
        guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
            fatalError("ViewController is not of the expected class \(T.self).")
        }
        return controller
    }
}

private final class BundleToken {}
