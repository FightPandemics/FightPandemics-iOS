//
//  MenuItem.swift
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

class MenuItem: UIView {
    let menuItem1 = UIView()
    let menuItem1text = UILabel()
    var linkImg: UIImageView?
    private var _onClick: () -> Void = {return}

    func draw(parentVC: UIViewController, width: CGFloat, centerX: CGFloat, centerY: CGFloat) {
        menuItem1.isUserInteractionEnabled = true
        menuItem1text.isUserInteractionEnabled = true
        linkImg?.isUserInteractionEnabled = true
        self.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(self.onClick)
            )
        )
        menuItem1.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(self.onClick)
            )
        )
        menuItem1text.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(self.onClick)
            )
        )
        linkImg?.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(self.onClick)
            )
        )
        menuItem1.frame.size.width = width
        menuItem1.center.x = centerX
        menuItem1.center.y = centerY
        menuItem1text.font = UIFont(name: "Montserrat-Bold", size: 18)
        menuItem1text.textColor = .white
        menuItem1text.sizeToFit()
        menuItem1text.frame.size.width = menuItem1.frame.size.width
        menuItem1.frame.size.height = (38.0 * figmaToiOSVerticalScalingFactor)
        menuItem1text.center = menuItem1.center
        menuItem1text.layer.zPosition = 1
        menuItem1.addLine(position: .bottom, color: .white, width: 0.5)
        if let linkImg = linkImg {
            linkImg.frame.size.height = menuItem1text.frame.size.height
            linkImg.frame.size.width = linkImg.frame.size.height
            linkImg.center.y = menuItem1.center.y
            linkImg.frame.origin.x = menuItem1.frame.maxX - linkImg.frame.size.width
            linkImg.isHidden = true
        }
        menuItem1text.isHidden = true
        menuItem1.isHidden = true
        linkImg?.layer.zPosition = 1
        menuItem1text.layer.zPosition = 1
        menuItem1.layer.zPosition = 1

        parentVC.view.addSubview(menuItem1)
        parentVC.view.addSubview(menuItem1text)
        if let linkImg = self.linkImg {
            parentVC.view.addSubview(linkImg)
        }
    }

    func toggleShow() {
           menuItem1.isHidden = !menuItem1.isHidden
           menuItem1text.isHidden = !menuItem1text.isHidden

           if let linkImg = self.linkImg {
               linkImg.isHidden = !linkImg.isHidden
        }
               if  menuItem1.isHidden == true {
                UIView.animate(withDuration: 0.7,
                   delay: 0.0,
                              options: [],
                              animations: { [weak self] in
                               if let controller = self {
                                   controller.menuItem1.center.x =  1000
                                     controller.menuItem1text.center.x =  1000

                                    controller.linkImg?.frame.origin.x =  controller.menuItem1text.frame.origin.x
                               }
                   }, completion: nil)
                   }
                if  menuItem1.isHidden == false {
                    UIView.animate(withDuration: 0.7,
                                               delay: 0.0,
                                                          options: [],
                                                          animations: { [weak self] in
                                                           if let controller = self {
                                                            controller.menuItem1.frame.origin.x =  0.9 * controller.screenWidth - controller.menuItem1.frame.width/1.14
                                                                 controller.menuItem1text.frame.origin.x =  0.9 * controller.screenWidth - controller.menuItem1text.frame.width/1.14
                                                                controller.linkImg?.frame.origin.x = controller.menuItem1text.frame.origin.x + 210

                                                           }
                                               }, completion: nil)
                   }

       }

    @objc func onClick() {
        self._onClick()
    }

    init(text: String, addLinkImg: Bool = false, onClick: @escaping () -> Void) {
        self.menuItem1text.text = text
        if addLinkImg {
            linkImg = UIImageView(image: UIImage(named: "launch-symbol"))
        }
        self._onClick = onClick
        super.init(frame: CGRect())
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
