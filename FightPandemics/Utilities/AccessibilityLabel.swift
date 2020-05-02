

import Foundation

/**
A centralized place to store strings for accessibility labels for applicaiton and UI testing use.
These will  be read to the user so must be localized.
 */

enum AccessibilityLabel {
    
    // MARK: Splash page
    static let startButton = NSLocalizedString("Start", comment: "Accessibility for start button")
    
    // MARK: Bluetooth page
    static let allowButton = NSLocalizedString("Allow Bluetooth", comment: "Accessibility for allow bluetooth button")
}
