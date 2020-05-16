//
//  Constraints+FightPandemics.swift
//  FightPandemics
//
//  Created by Harlan Kellaway on 5/15/20.
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

/// Constraint utility.
/// - Remark: Inspired by jdisho/VanillaConstraints.

extension UIView {

    // MARK: NSLayoutDimension

    @discardableResult
    func addWidthConstraint(
        _ constant: CGFloat,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        return widthAnchor
            .constraint(toConstant: constant, relation: relation)
            .priority(priority)
            .activate()
    }

    @discardableResult
    func addWidthConstraint<XAxisDimension>(
        to dimension: KeyPath<UIView, XAxisDimension>,
        of otherView: UIView? = nil,
        multiplier: CGFloat = 1,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint? where XAxisDimension: NSLayoutDimension {
        guard let otherView = otherView else { return nil }
        return widthAnchor
            .constraint(to: otherView[keyPath: dimension], multiplier: multiplier, relation: relation)
            .offset(constant)
            .priority(priority)
            .activate()
    }

    @discardableResult
    func addHeightConstraint(
        _ constant: CGFloat,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint {
        return heightAnchor
            .constraint(toConstant: constant, relation: relation)
            .priority(priority)
            .activate()
    }

    @discardableResult
    func addHeightConstraint<YAxisDimension>(
        to dimension: KeyPath<UIView, YAxisDimension>,
        of otherView: UIView? = nil,
        multiplier: CGFloat = 1,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint? where YAxisDimension: NSLayoutDimension {
        guard let otherView = otherView else { return nil }
        return heightAnchor
            .constraint(to: otherView[keyPath: dimension], multiplier: multiplier, relation: relation)
            .offset(constant)
            .priority(priority)
            .activate()
    }

    // MARK: NSLayoutXAxisAnchor

    @discardableResult
    func addLeadingConstraint<XAxisAnchor>(
        to anchor: KeyPath<UIView, XAxisAnchor>,
        of otherView: UIView? = nil,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint? where XAxisAnchor: NSLayoutXAxisAnchor {
        guard let otherView = otherView else { return nil }
        return leadingAnchor
            .constraint(to: otherView[keyPath: anchor], relation: relation)
            .offset(constant)
            .priority(priority)
            .activate()
    }

    @discardableResult
    func addTrailingConstraint<XAxisAnchor>(
        to anchor: KeyPath<UIView, XAxisAnchor>,
        of otherView: UIView? = nil,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint? where XAxisAnchor: NSLayoutXAxisAnchor {
        guard let otherView = otherView else { return nil }
        return trailingAnchor
            .constraint(to: otherView[keyPath: anchor], relation: relation)
            .offset(constant)
            .priority(priority)
            .activate()
    }

    @discardableResult
    func addLeftConstraint<XAxisAnchor>(
        to anchor: KeyPath<UIView, XAxisAnchor>,
        of otherView: UIView? = nil,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint? where XAxisAnchor: NSLayoutXAxisAnchor {
        guard let otherView = otherView else { return nil }
        return leftAnchor
            .constraint(to: otherView[keyPath: anchor], relation: relation)
            .offset(constant)
            .priority(priority)
            .activate()
    }

    @discardableResult
    func addRightConstraint<XAxisAnchor>(
        to anchor: KeyPath<UIView, XAxisAnchor>,
        of otherView: UIView? = nil,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint? where XAxisAnchor: NSLayoutXAxisAnchor {
        guard let otherView = otherView else { return nil }
        return rightAnchor
            .constraint(to: otherView[keyPath: anchor], relation: relation)
            .offset(constant)
            .priority(priority)
            .activate()
    }

    @discardableResult
    func addCenterXConstraint<XAxisAnchor>(
        to anchor: KeyPath<UIView, XAxisAnchor>,
        of otherView: UIView? = nil,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint? where XAxisAnchor: NSLayoutXAxisAnchor {
        guard let otherView = otherView else { return nil }
        return centerXAnchor
            .constraint(to: otherView[keyPath: anchor], relation: relation)
            .offset(constant)
            .priority(priority)
            .activate()
    }

    // MARK: NSLayoutYAxisAnchor

    @discardableResult
    func addTopConstraint<YAxisAnchor>(
        to anchor: KeyPath<UIView, YAxisAnchor>,
        of otherView: UIView? = nil,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint? where YAxisAnchor: NSLayoutYAxisAnchor {
        guard let otherView = otherView else { return nil }
        return topAnchor
            .constraint(to: otherView[keyPath: anchor], relation: relation)
            .offset(constant)
            .priority(priority)
            .activate()
    }

    @discardableResult
    func addBottomConstraint<YAxisAnchor>(
        to anchor: KeyPath<UIView, YAxisAnchor>,
        of otherView: UIView? = nil,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint? where YAxisAnchor: NSLayoutYAxisAnchor {
        guard let otherView = otherView else { return nil }
        return bottomAnchor
            .constraint(to: otherView[keyPath: anchor], relation: relation)
            .offset(constant)
            .priority(priority)
            .activate()
    }

    @discardableResult
    func addCenterYConstraint<YAxisAnchor>(
        to anchor: KeyPath<UIView, YAxisAnchor>,
        of otherView: UIView? = nil,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint? where YAxisAnchor: NSLayoutYAxisAnchor {
        guard let otherView = otherView else { return nil }
        return centerYAnchor
            .constraint(to: otherView[keyPath: anchor], relation: relation)
            .offset(constant)
            .priority(priority)
            .activate()
    }

}

// MARK: - NSLayoutDimension

extension NSLayoutDimension {

    fileprivate func constraint(
        to dimension: NSLayoutDimension,
        multiplier: CGFloat,
        relation: NSLayoutConstraint.Relation
        ) -> NSLayoutConstraint {
        switch relation {
        case .equal:
            return constraint(equalTo: dimension, multiplier: multiplier)
        case .lessThanOrEqual:
            return constraint(lessThanOrEqualTo: dimension, multiplier: multiplier)
        case .greaterThanOrEqual:
            return constraint(greaterThanOrEqualTo: dimension, multiplier: multiplier)
        @unknown default:
            fatalError("Unexpected value provided by framework.")
        }
    }

    fileprivate func constraint(
        toConstant constant: CGFloat,
        relation: NSLayoutConstraint.Relation = .equal
        ) -> NSLayoutConstraint {
        switch relation {
        case .equal:
            return constraint(equalToConstant: constant)
        case .lessThanOrEqual:
            return constraint(lessThanOrEqualToConstant: constant)
        case .greaterThanOrEqual:
            return constraint(greaterThanOrEqualToConstant: constant)
        @unknown default:
            fatalError("Unexpected value provided by framework.")
        }
    }

}

// MARK: - NSLayoutXAxisAnchor

extension NSLayoutXAxisAnchor {

    fileprivate func constraint(to anchor: NSLayoutXAxisAnchor,
                                relation: NSLayoutConstraint.Relation) -> NSLayoutConstraint {
        switch relation {
        case .equal:
            return constraint(equalTo: anchor)
        case .lessThanOrEqual:
            return constraint(lessThanOrEqualTo: anchor)
        case .greaterThanOrEqual:
            return constraint(greaterThanOrEqualTo: anchor)
        @unknown default:
            fatalError("Unexpected value provided by framework.")
        }
    }

}

// MARK: - NSLayoutYAxisAnchor

extension NSLayoutYAxisAnchor {

    fileprivate func constraint(to anchor: NSLayoutYAxisAnchor,
                                relation: NSLayoutConstraint.Relation) -> NSLayoutConstraint {
        switch relation {
        case .equal:
            return constraint(equalTo: anchor)
        case .lessThanOrEqual:
            return constraint(lessThanOrEqualTo: anchor)
        case .greaterThanOrEqual:
            return constraint(greaterThanOrEqualTo: anchor)
        @unknown default:
            fatalError("Unexpected value provided by framework.")
        }
    }

}

// MARK: - NSLayoutConstraint

extension NSLayoutConstraint {

    fileprivate func priority(_ priority: UILayoutPriority) -> Self {
        self.priority = priority
        return self
    }

    fileprivate func offset(_ offset: CGFloat) -> Self {
        constant = offset
        return self
    }

    fileprivate func activate() -> Self {
        isActive = true
        return self
    }

    fileprivate func deactivate() -> Self {
        isActive = false
        return self
    }

}
