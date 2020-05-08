//
//  Header.swift
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

class Header: UIView {
    weak var parentVC: BaseViewController!
    var logo = UIImageView(image: UIImage(named: "logo"))
    var menuIcon = UIImageView(image: UIImage(named: "bars"))
    var blob = UIImageView(image: UIImage(named: "blob"))
    var menu: Menu?
    private var _hasMenu: Bool = true
    var hasMenu: Bool {
        get {
            return _hasMenu
        }
        set (val) {
            self._hasMenu = val
            if val {
                self.menuIcon.isHidden = false
            } else {
                self.menuIcon.isHidden = true
            }
        }
    }

    init(_ parentVC: BaseViewController) {
        self.parentVC = parentVC
        self.menu = Menu(parentVC)
        super.init(frame: CGRect())
        self.frame.size.width = screenWidth
        self.frame.size.height = screenHeight * 0.1
    }

    func draw() {
        self.frame.origin.y = parentVC.view.safeAreaInsets.top
        drawBlob()
        drawLogo()
        drawMenuIcon()

    }

    private func drawBlob() {

    }
    private func drawLogo() {
        logo.frame.size.width = 35
        logo.frame.size.height = 35
        // line up logo with the rest of the left hand content
        logo.frame.origin.x = (screenWidth - contentMaxWidth) / 2
        logo.center.y = self.frame.midY
        parentVC.view.addSubview(logo)
    }

    private func drawMenuIcon() {
        menuIcon.frame.size.width = 36
        menuIcon.frame.size.height = 36
        // line up menu icon with the rest of the right hand content
        menuIcon.center.x = 0.9 * screenWidth
        menuIcon.frame.origin.x = screenWidth - ((screenWidth - contentMaxWidth) / 2) - menuIcon.frame.size.width
        menuIcon.center.y = self.frame.midY
        menuIcon.isUserInteractionEnabled = true
        menuIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.toggleMenu)))
        parentVC.view.addSubview(menuIcon)
        parentVC.view.bringSubviewToFront(menuIcon)
    }

    @objc func toggleMenu() {
        self.menu?.toggleMenu()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
