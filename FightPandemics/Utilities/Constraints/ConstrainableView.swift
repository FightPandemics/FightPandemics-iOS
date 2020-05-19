//
//  ConstrainableView.swift
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

/// View assumed to have a state and follow usage compatible with being constrained programmatically.
protocol ConstrainableView: AnyObject {
    var superview: UIView? { get }
    var target: UIView { get }
}

extension UIView: ConstrainableView {
    var target: UIView {
        return self
    }
}

extension ConstrainableView {
    /// Adds this view as a child of the provided view. Prefer over `addSubview`.
    ///  - Postcondition: After calling, this view will be prepared to work with programmatic constraints.
    /// - Parameter other: View to make this view a child of.
    @discardableResult
    func makeSubview(of other: UIView) -> Self {
        target.translatesAutoresizingMaskIntoConstraints = false
        other.addSubview(target)
        return self
    }

    // MARK: - Chainable Constraints

    // MARK: Convenience

    @discardableResult
    func pinToEdges(of view: UIView? = nil, withMargin margin: CGFloat = 0, useSafeArea: Bool = false) -> Self {
        let insets = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        return pinToEdges(of: view, withInsets: insets, useSafeArea: useSafeArea)
    }

    @discardableResult
    func pinToEdges(of view: UIView? = nil, withInsets insets: UIEdgeInsets, useSafeArea: Bool = false) -> Self {
        if useSafeArea {
            return top(to: \.safeAreaLayoutGuide.topAnchor, of: view, constant: insets.top)
                .right(to: \.safeAreaLayoutGuide.rightAnchor, of: view, constant: insets.right)
                .bottom(to: \.safeAreaLayoutGuide.bottomAnchor, of: view, constant: insets.bottom)
                .left(to: \.safeAreaLayoutGuide.leftAnchor, of: view, constant: insets.left)
        }

        return top(to: \.topAnchor, of: view, constant: insets.top)
            .right(to: \.rightAnchor, of: view, constant: insets.right)
            .bottom(to: \.bottomAnchor, of: view, constant: insets.bottom)
            .left(to: \.leftAnchor, of: view, constant: insets.left)
    }

    @discardableResult
    func center(in view: UIView? = nil, withMargin margin: CGFloat = 0, relation: NSLayoutConstraint.Relation = .equal) -> Self {
        return centerX(to: \.centerXAnchor, of: view, relation: relation, constant: margin)
            .centerY(to: \.centerYAnchor, of: view, relation: relation, constant: margin)
    }

    @discardableResult
    func size(_ size: CGSize, relation: NSLayoutConstraint.Relation = .equal) -> Self {
        return width(size.width, relation: relation)
            .height(size.height, relation: relation)
    }

    // MARK: NSLayoutDimension

    @discardableResult
    func width(
        _ constant: CGFloat,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> Self {
        target.addWidthConstraint(constant, relation: relation, priority: priority)
        return self
    }

    @discardableResult
    func width<XAxisDimension>(
        to dimension: KeyPath<UIView, XAxisDimension>,
        of otherView: UIView? = nil,
        multiplier: CGFloat = 1,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> Self where XAxisDimension: NSLayoutDimension {
        let view = otherView ?? superview
        precondition(view != nil, "ConstrainableView assumes a view to constrain to.")
        target.addWidthConstraint(to: dimension, of: view!, multiplier: multiplier, constant: constant, relation: relation, priority: priority)
        return self
    }

    @discardableResult
    func height(
        _ constant: CGFloat,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> Self {
        target.addHeightConstraint(constant, relation: relation, priority: priority)
        return self
    }

    @discardableResult
    func height<YAxisDimension>(
        to dimension: KeyPath<UIView, YAxisDimension>,
        of otherView: UIView? = nil,
        multiplier: CGFloat = 1,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> Self where YAxisDimension: NSLayoutDimension {
        let view = otherView ?? superview
        precondition(view != nil, "ConstrainableView assumes a view to constrain to.")
        target.addHeightConstraint(to: dimension, of: view!, multiplier: multiplier, constant: constant, relation: relation, priority: priority)
        return self
    }

    // MARK: NSLayoutXAsixAnchor

    @discardableResult
    func leading<XAxisAnchor>(
        to anchor: KeyPath<UIView, XAxisAnchor>,
        of otherView: UIView? = nil,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
    ) -> Self where XAxisAnchor: NSLayoutXAxisAnchor {
        let view = otherView ?? superview
        precondition(view != nil, "ConstrainableView assumes a view to constrain to.")
        target.addLeadingConstraint(to: anchor, of: view!, relation: relation, constant: constant, priority: priority)
        return self
    }

    @discardableResult
    func trailing<XAxisAnchor>(
        to anchor: KeyPath<UIView, XAxisAnchor>,
        of otherView: UIView? = nil,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
    ) -> Self where XAxisAnchor: NSLayoutXAxisAnchor {
        let view = otherView ?? superview
        precondition(view != nil, "ConstrainableView assumes a view to constrain to.")
        target.addTrailingConstraint(to: anchor, of: view!, relation: relation, constant: constant, priority: priority)
        return self
    }

    @discardableResult
    func left<XAxisAnchor>(
        to anchor: KeyPath<UIView, XAxisAnchor>,
        of otherView: UIView? = nil,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
    ) -> Self where XAxisAnchor: NSLayoutXAxisAnchor {
        let view = otherView ?? superview
        precondition(view != nil, "ConstrainableView assumes a view to constrain to.")
        target.addLeftConstraint(to: anchor, of: view!, relation: relation, constant: constant, priority: priority)
        return self
    }

    @discardableResult
    func right<XAxisAnchor>(
        to anchor: KeyPath<UIView, XAxisAnchor>,
        of otherView: UIView? = nil,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
    ) -> Self where XAxisAnchor: NSLayoutXAxisAnchor {
        let view = otherView ?? superview
        precondition(view != nil, "ConstrainableView assumes a view to constrain to.")
        target.addRightConstraint(to: anchor, of: view!, relation: relation, constant: constant, priority: priority)
        return self
    }

    @discardableResult
    func centerX<XAxisAnchor>(
        to anchor: KeyPath<UIView, XAxisAnchor>,
        of otherView: UIView? = nil,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
    ) -> Self where XAxisAnchor: NSLayoutXAxisAnchor {
        let view = otherView ?? superview
        precondition(view != nil, "ConstrainableView assumes a view to constrain to.")
        target.addCenterXConstraint(to: anchor, of: view!, relation: relation, constant: constant, priority: priority)
        return self
    }

    // MARK: NSLayoutYAxisAnchor

    @discardableResult
    func top<YAxisAnchor>(
        to anchor: KeyPath<UIView, YAxisAnchor>,
        of otherView: UIView? = nil,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
    ) -> Self where YAxisAnchor: NSLayoutYAxisAnchor {
        let view = otherView ?? superview
        precondition(view != nil, "ConstrainableView assumes a view to constrain to.")
        target.addTopConstraint(to: anchor, of: view!, relation: relation, constant: constant, priority: priority)
        return self
    }

    @discardableResult
    func bottom<YAxisAnchor>(
        to anchor: KeyPath<UIView, YAxisAnchor>,
        of otherView: UIView? = nil,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
    ) -> Self where YAxisAnchor: NSLayoutYAxisAnchor {
        let view = otherView ?? superview
        precondition(view != nil, "ConstrainableView assumes a view to constrain to.")
        target.addBottomConstraint(to: anchor, of: view!, relation: relation, constant: constant, priority: priority)
        return self
    }

    @discardableResult
    func centerY<YAxisAnchor>(
        to anchor: KeyPath<UIView, YAxisAnchor>,
        of otherView: UIView? = nil,
        relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
    ) -> Self where YAxisAnchor: NSLayoutYAxisAnchor {
        let view = otherView ?? superview
        precondition(view != nil, "ConstrainableView assumes a view to constrain to.")
        target.addCenterYConstraint(to: anchor, of: view!, relation: relation, constant: constant, priority: priority)
        return self
    }
}
