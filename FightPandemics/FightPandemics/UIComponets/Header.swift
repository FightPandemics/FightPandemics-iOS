

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
//        line up logo with the rest of the left hand content
        logo.frame.origin.x = (screenWidth - contentMaxWidth) / 2
        logo.center.y = self.frame.midY
        parentVC.view.addSubview(logo)
    }

    private func drawMenuIcon() {
        menuIcon.frame.size.width = 36
        menuIcon.frame.size.height = 36
//        line up menu icon with the rest of the right hand content
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
