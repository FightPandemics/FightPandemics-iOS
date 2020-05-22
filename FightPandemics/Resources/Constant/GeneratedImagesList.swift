// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
    import AppKit.NSImage
    internal typealias AssetColorTypeAlias = NSColor
    internal typealias AssetImageTypeAlias = NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
    import UIKit.UIImage
    internal typealias AssetColorTypeAlias = UIColor
    internal typealias AssetImageTypeAlias = UIImage
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
    internal static let darkGrayTextColor = ColorAsset(name: "DarkGrayTextColor")
    internal static let tagBackgroundColor = ColorAsset(name: "TagBackgroundColor")
    internal static let tagBackgroundGrayColor = ColorAsset(name: "TagBackgroundGrayColor")
    internal static let tagLabelColor = ColorAsset(name: "TagLabelColor")
    internal static let chevronDown = ImageAsset(name: "chevron-down")
    internal static let favorite24px = ImageAsset(name: "favorite_24px")
    internal static let feed = ImageAsset(name: "feed")
    internal static let heart = ImageAsset(name: "heart")
    internal static let heartFilled = ImageAsset(name: "heart_filled")
    internal static let iconNavFilter = ImageAsset(name: "icon-nav-filter")
    internal static let inbox = ImageAsset(name: "inbox")
    internal static let logo = ImageAsset(name: "logo")
    internal static let messageSquare = ImageAsset(name: "message-square")
    internal static let minus = ImageAsset(name: "minus")
    internal static let plus = ImageAsset(name: "plus")
    internal static let post = ImageAsset(name: "post")
    internal static let profile = ImageAsset(name: "profile")
    internal static let search = ImageAsset(name: "search")
    internal static let send = ImageAsset(name: "send")
    internal static let send24px = ImageAsset(name: "send_24px")
    internal static let tag = ImageAsset(name: "tag")
    internal static let x = ImageAsset(name: "x")
}

// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ColorAsset {
    internal fileprivate(set) var name: String

    @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
    internal var color: AssetColorTypeAlias {
        return AssetColorTypeAlias(asset: self)
    }
}

internal extension AssetColorTypeAlias {
    @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
    convenience init!(asset: ColorAsset) {
        let bundle = Bundle(for: BundleToken.self)
        #if os(iOS) || os(tvOS)
            self.init(named: asset.name, in: bundle, compatibleWith: nil)
        #elseif os(OSX)
            self.init(named: NSColor.Name(asset.name), bundle: bundle)
        #elseif os(watchOS)
            self.init(named: asset.name)
        #endif
    }
}

internal struct DataAsset {
    internal fileprivate(set) var name: String

    #if os(iOS) || os(tvOS) || os(OSX)
        @available(iOS 9.0, tvOS 9.0, OSX 10.11, *)
        internal var data: NSDataAsset {
            return NSDataAsset(asset: self)
        }
    #endif
}

#if os(iOS) || os(tvOS) || os(OSX)
    @available(iOS 9.0, tvOS 9.0, OSX 10.11, *)
    internal extension NSDataAsset {
        convenience init!(asset: DataAsset) {
            let bundle = Bundle(for: BundleToken.self)
            #if os(iOS) || os(tvOS)
                self.init(name: asset.name, bundle: bundle)
            #elseif os(OSX)
                self.init(name: NSDataAsset.Name(asset.name), bundle: bundle)
            #endif
        }
    }
#endif

internal struct ImageAsset {
    internal fileprivate(set) var name: String

    internal var image: AssetImageTypeAlias {
        let bundle = Bundle(for: BundleToken.self)
        #if os(iOS) || os(tvOS)
            let image = AssetImageTypeAlias(named: name, in: bundle, compatibleWith: nil)
        #elseif os(OSX)
            let image = bundle.image(forResource: NSImage.Name(name))
        #elseif os(watchOS)
            let image = AssetImageTypeAlias(named: name)
        #endif
        guard let result = image else { fatalError("Unable to load image named \(name).") }
        return result
    }
}

internal extension AssetImageTypeAlias {
    @available(iOS 1.0, tvOS 1.0, watchOS 1.0, *)
    @available(OSX, deprecated,
               message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
    convenience init!(asset: ImageAsset) {
        #if os(iOS) || os(tvOS)
            let bundle = Bundle(for: BundleToken.self)
            self.init(named: asset.name, in: bundle, compatibleWith: nil)
        #elseif os(OSX)
            self.init(named: NSImage.Name(asset.name))
        #elseif os(watchOS)
            self.init(named: asset.name)
        #endif
    }
}

private final class BundleToken {}
