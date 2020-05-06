//
//  Home.swift
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

class ViewController: BaseViewController {
    var news1: Button!
    var news2: Button!
    var news3: Button!
    var news4: Button!
    var pro: Progress!
    var text1: LargeText!
    var text2: MainText!
     var shade = UIView()
     var panGesture = UIPanGestureRecognizer()
    var blob = UIImageView(image: UIImage(named: "blob"))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.Primary.Sand

    panGesture = UIPanGestureRecognizer(target: self, action: #selector(draggedView2(_:)))
                              view.isUserInteractionEnabled = true
                view.addGestureRecognizer(panGesture)

   drawScreen()
    }
    func drawScreen() {

       self.text1 = LargeText(self, text: "A place to give and get help")
                  text1.center.x = view.center.x
        text1.center.y = view.center.y - screenHeight/2.8
        text1.backgroundColor = .clear
        text1.textAlignment = .center

                   view.addSubview(text1)

        self.text2 = MainText(self, text: " Pandemics will continue to happen.\n We help communities prepare and respond.")
                         text2.center.x = view.center.x
                          text2.center.y = text1.center.y + screenHeight/19
         text2.textAlignment = .center
        text2.backgroundColor = .clear

         view.addSubview(text2)

        self.news1 = Button(self, text: "Need Help", subtext: "")
            news1.center.x = view.center.x
        news1.center.y = text2.center.y + screenHeight/4.5
        news1.backgroundColor = UIColor.Primary.News
             view.addSubview(news1)
             news1.text.sizeToFit()
        news1.img.image = UIImage(named: "youth2")
        news1.img.frame.size.width = news1.frame.size.width/3
            news1.drawText()

        news1.layer.shadowColor = UIColor.lightGray.cgColor
                               news1.layer.shadowOpacity = 0.2
                             //  news1.layer.shadowOffset = .init(width: 10, height: 10)
                               news1.layer.shadowRadius = 10

            self.news2 = Button(self, text: "Give Help", subtext: "")
                   news2.center.x = news1.center.x
        news2.center.y = news1.center.y + screenHeight/2.5
                    view.addSubview(news2)
                     news2.backgroundColor = UIColor.Primary.News
         news2.text.sizeToFit()
                   news2.drawText()
        news2.layer.shadowColor = UIColor.lightGray.cgColor
                                     news2.layer.shadowOpacity = 0.2
                                   //  news1.layer.shadowOffset = .init(width: 10, height: 10)
    }

    override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()

          self.view.addSubview(shade)
                         shade.backgroundColor = .black
                         shade.frame.size.width = screenWidth
                          shade.frame.size.height = screenHeight
                       shade.alpha = 0.0
         super.drawMenuOnTop()

          NotificationCenter.default.addObserver(self, selector: #selector(self.fade), name: NSNotification.Name(rawValue: "notificationName"), object: nil)
      }

    @objc func fade(_ notification: NSNotification) {

                 UIView.animate(
                    withDuration: 0.5, delay: 0.0, options: [],
                     animations: { [weak self] in
                         if let controller = self {
                            if controller.shade.alpha == 0.0 {
                                controller.shade.alpha = 0.6
                                print(1)
                            }
                                if controller.shade.alpha == 0.6 {
                                controller.shade.alpha = 0
                                print(2)
                             }
                         }
                     }, completion: nil)

    }
    @objc func draggedView2(_ sender: UIPanGestureRecognizer) {
           UIView.animate(
            withDuration: 0.7, delay: 0.0, options: [],
                                animations: { [weak self] in
                                    if let controller = self {

                                     let translation = sender.translation(in: controller.view)

                                        controller.news1.center = CGPoint(x: controller.news1.center.x + translation.x/2, y: controller.news1.center.y)

                                        controller.news1.text.center.x = controller.news1.center.x - controller.news1.frame.size.width/5

                                        controller.news1.img.center.x = controller.news1.center.x
                                        controller.news1.img.center.y = controller.news1.center.y - 20

                                    }
                                }, completion: nil)

        if news1.center.x > view.center.x {
            UIView.animate(
                       withDuration: 0.7, delay: 0.1, options: [],
                                           animations: { [weak self] in
                                               if let controller = self {

                                                controller.news1.center.x = controller.view.center.x - controller.screenWidth/10
                                                controller.news1.text.center.x = controller.news1.center.x - controller.news1.frame.size.width/5

                                                controller.news1.img.center.x = controller.news1.center.x
                                                controller.news1.img.center.y = controller.news1.center.y - 20

                                               }
                                           }, completion: nil)
        }

        if news4.center.x < view.center.x {
                   UIView.animate(
                              withDuration: 0.7, delay: 0.1, options: [],
                                                  animations: { [weak self] in
                                                      if let controller = self {

                                                     print(1)
                                                          controller.news1.center.x =  controller.news1.center.x + controller.news1.frame.size.width - 50
                                                        controller.news4.center.x =  controller.news2.center.x + controller.news1.frame.size.width + 50
                                                          controller.news4.text.center.x = controller.news3.center.x - controller.news3.frame.size.width/3.5

                                                        controller.news4.img.center.x = controller.news4.center.x
                                                        controller.news4.img.center.y = controller.news4.center.y - 20

                                                      }
                                                  }, completion: nil)
               }
       UIView.animate(
        withDuration: 0.7, delay: 0.1, options: [],
                            animations: { [weak self] in
                                if let controller = self {
                                    controller.news2.center.x =  controller.news1.center.x  + controller.news1.frame.width + 50
                                 controller.news2.text.center.x = controller.news2.center.x - controller.news2.frame.size.width/3.5
                                    controller.news2.img.center.x = controller.news2.center.x
                                    controller.news2.img.center.y = controller.news2.center.y - 20

                                }
                            }, completion: nil)
        UIView.animate(
            withDuration: 0.7, delay: 0.2, options: [],
                                   animations: { [weak self] in
                                       if let controller = self {
                                           controller.news3.center.x = controller.news2.center.x  + controller.news2.frame.width + 50
                                        controller.news3.text.center.x = controller.news3.center.x - controller.news3.frame.size.width/3.5
                                          controller.news3.img.center.x = controller.news3.center.x
                                                                            controller.news3.img.center.y = controller.news3.center.y - 20

                                       }
                                   }, completion: nil)

    UIView.animate(
    withDuration: 0.7, delay: 0.3, options: [],
                           animations: { [weak self] in
                               if let controller = self {
                                   controller.news4.center.x = controller.news3.center.x  + controller.news2.frame.width + 50
                                controller.news4.text.center.x = controller.news4.center.x - controller.news4.frame.size.width/3.5
                                  controller.news4.img.center.x = controller.news4.center.x
                                                                                                            controller.news4.img.center.y = controller.news4.center.y - 20

                               }
                           }, completion: nil)
}

}
