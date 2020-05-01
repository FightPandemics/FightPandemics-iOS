//
//  Header.swift
//  COVIDWatch iOS
//
//  Created by Isaiah Becker-Mayer on 4/6/20.
//  Copyright © 2020 IZE. All rights reserved.
//

import UIKit

class Button: UIView {
    weak var parentVC: BaseViewController!
    var text = UILabel()
    var subtext: UITextView?
    var img = UIImageView(image: UIImage(named: "youth"))
    init(_ parentVC: BaseViewController, text: String, subtext: String? = nil) {
        self.parentVC = parentVC
        super.init(frame: CGRect())
        self.text.text = text
        if subtext != nil {
            self.subtext = UITextView()
        }
        self.subtext?.text = subtext

        self.frame.size.width = screenWidth/1.7
        self.frame.size.height = screenWidth/1.6
        self.backgroundColor = UIColor.Primary.News
        self.layer.borderWidth = 3
         self.layer.borderColor = UIColor(red: 0.257, green: 0.352, blue: 0.95, alpha: 1).cgColor
        self.layer.cornerRadius = 20
        var buttonFontSize: CGFloat = screenWidth/15
        var subtextFontSize: CGFloat = 14
       
        self.text.font = self.text.font.withSize(buttonFontSize)
        self.text.textColor = .black
        self.text.backgroundColor = .clear
        self.subtext?.font = UIFont(name: "Montserrat", size: subtextFontSize)
        self.subtext?.textColor = UIColor.Primary.Gray
        self.subtext?.backgroundColor = .clear
        self.subtext?.textAlignment = .center
        self.subtext?.isEditable = false
        // accessibility
        self.text.accessibilityIdentifier = AccessibilityIdentifier.ButtonText.rawValue
        self.subtext?.accessibilityIdentifier = AccessibilityIdentifier.SubText.rawValue
        
        self.img.frame.size.width = self.frame.size.width/1.5
        self.img.frame.size.height = self.frame.size.width/1.5
    }

//    Call this after you set where you want to place your button in the parentVC
    func draw(centerX: CGFloat, centerY: CGFloat) {
       
        
        parentVC.view.addSubview(self)
        drawText()
    }

  

    func drawText() {
        self.text.center.x = self.center.x
        self.text.center.y = self.center.y + self.frame.size.height/2.5
        
        self.img.center.x = self.center.x
               self.img.center.y = self.center.y - 20
//        Call after the button's container has been laid out in parent ViewController
        self.text.sizeToFit()
        
        parentVC.view.addSubview(self.text)
          parentVC.view.addSubview(self.img)
        self.subtext?.frame.size.width = contentMaxWidth
        self.subtext?.frame.size.height = self.subtext?.contentSize.height ?? 0
        self.subtext?.center.x = self.text.center.x
        self.subtext?.frame.origin.y = self.frame.maxY
        if let subtext = self.subtext {
            //parentVC.view.addSubview(subtext)
        }
        self.subtext?.isSelectable = false
    }

    func drawBetween(top: CGFloat, bottom: CGFloat, centerX: CGFloat) {
//        Draw the button so that it and its subtext taken together are
//        centered between top and bottom
        self.draw(centerX: centerX, centerY: (top+bottom)/2)
        if let subtext = self.subtext {
            let adjustment = (subtext.frame.maxY - self.frame.maxY) / 2
            self.center.y -= adjustment
            self.text.center.y -= adjustment
            subtext.center.y -= adjustment
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
