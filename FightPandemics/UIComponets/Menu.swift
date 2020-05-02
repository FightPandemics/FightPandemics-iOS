

import UIKit

let MANUAL_STATE_TEST = false

class Menu: UIView {
    
    weak var parentVC: BaseViewController?
    var xIcon = UIImageView(image: UIImage(named: "x-icon"))
    var menuItems: [MenuItem] = []
    var bottomWaterMark = UIImageView(image: UIImage(named: "collab"))
  var hide = true
    func draw() {

        drawMenuBackground()
        drawXIcon()
        drawMenuItems()
        drawBottomText()
    }
    
    private func drawMenuBackground() {
       
        self.frame.size.width = 0.8 * screenWidth
        self.frame.size.height = screenHeight
        self.frame.origin.x = screenWidth - self.frame.size.width + 1000
        if let parentVC = self.parentVC {
            self.frame.origin.y = 0
        
        self.backgroundColor = UIColor(red: 0.257, green: 0.352, blue: 0.95, alpha: 1)
        self.isHidden = false
        self.layer.zPosition = 1
        parentVC.view.addSubview(self)
        }
    }
    
    private func drawXIcon() {
        xIcon.frame.size.width = 23
        xIcon.frame.size.height = 23
        xIcon.center.x = 0.9 * screenWidth + 1000
        if let parentVC = self.parentVC {
            xIcon.center.y = (screenHeight * 0.1)/2 + parentVC.view.safeAreaInsets.top
        }
        xIcon.isHidden = false
        xIcon.isUserInteractionEnabled = true
        xIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.toggleMenu)))
        xIcon.layer.zPosition = 1
        parentVC?.view.addSubview(xIcon)
    }
    
    private func drawMenuItems() {
        let menuItemWidth = (3.0/3.75) * self.frame.size.width
        let firstItemYValue = 160.0 * figmaToiOSVerticalScalingFactor
        let menuItemYGap = 58.0 * figmaToiOSVerticalScalingFactor
        
        var lastYCenter: CGFloat = 0.0
        for (index, item) in self.menuItems.enumerated() {
            var yCenter: CGFloat
            if index == 0 {
                yCenter = firstItemYValue
            } else {
                yCenter = lastYCenter + menuItemYGap
            }
            lastYCenter = yCenter
            if let parentVC = self.parentVC {
                item.draw(parentVC: parentVC, width: menuItemWidth, centerX: self.center.x, centerY: yCenter)
            }
        }
    }
    
    private func drawBottomText() {
        bottomWaterMark.frame.size.width = screenWidth/2.5
        bottomWaterMark.frame.size.height = screenWidth/5.7
        bottomWaterMark.center.x = self.center.x
        bottomWaterMark.center.y = screenHeight - (69.5 * figmaToiOSVerticalScalingFactor)*2
        //bottomWaterMark.isHidden = true
        bottomWaterMark.alpha = 0
        bottomWaterMark.layer.zPosition = 1
       // parentVC?.view.addSubview(bottomWaterMark)
    }
    @objc func toggleMenu() {
       NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notificationName"), object: nil)
        
        for menuItem in menuItems {
            menuItem.toggleShow()
        }
       hide = !hide
        if  hide == true {
              self.bottomWaterMark.alpha = 0
            UIView.animate(
                withDuration: 0.7, delay: 0.0, options: [],
                animations: { [weak self] in
                    if let controller = self {
                        controller.frame.origin.x =  controller.screenWidth - controller.frame.size.width + 1000
                        controller.xIcon.frame.origin.x = 0.9 * controller.screenWidth + 1000
                       
                        
                    }
                }, completion: nil)
        }
        if  hide == false {

            UIView.animate(
                
                withDuration: 0.7, delay: 0.0, options: [],
                animations: { [weak self] in
                    if let controller = self {
                        controller.frame.origin.x =  controller.screenWidth - controller.frame.size.width
                        controller.xIcon.frame.origin.x = 0.9 * controller.screenWidth
                        
                        controller.bottomWaterMark.center.x = controller.center.x
                        controller.bottomWaterMark.alpha = 1
                    }
                }, completion: nil)
            
        }
        
    }
    
  
    // swiftlint:disable:next function_body_length
    init(_ parentVC: BaseViewController) {
        self.parentVC = parentVC
        super.init(frame: CGRect())
        let defaults = UserDefaults.standard
        
       
       
        if !MANUAL_STATE_TEST {
            self.menuItems.append(contentsOf: [
                MenuItem( text: "Profile", addLinkImg: false, onClick: {
                    if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(settingsURL)
                    }
                }),
                MenuItem( text: "Organization", addLinkImg: false, onClick: {
                    if let parentVC = self.parentVC {
                        parentVC.performSegue(withIdentifier: "test", sender: parentVC)
                    }
                }),
                MenuItem( text: "Health Facilities", addLinkImg: false, onClick: {
                    print("Clicked How does this work?") // Dummy function for now
                }),
                MenuItem( text: "Symptom Check", addLinkImg: false, onClick: {
                    if let url = URL(string: "https://www.covid-watch.org/") {
                        UIApplication.shared.open(url)
                    }
                }),
                MenuItem( text: "Feed", addLinkImg: false, onClick: {
                    if let url = URL(string: "https://www.cdc.gov/coronavirus/2019-nCoV/index.html") {
                        UIApplication.shared.open(url)
                    }
                }),
                MenuItem(text: "Feedback", addLinkImg: false, onClick: {
                    print("Clicked Terms of Use") // Dummy function for now
                }),
               MenuItem(text: "Logout", addLinkImg: false, onClick: {
                                 print("Clicked Terms of Use") // Dummy function for now
                             }),
                
            ])
 
        
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
