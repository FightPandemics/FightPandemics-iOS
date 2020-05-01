

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
     
    var blob = UIImageView(image: UIImage(named: "blob"))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.Primary.Sand
       
   
        
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
         
        
        
        UIView.animate(
                  withDuration: 0.7, delay: 0.0, options: [],
                                      animations: { [weak self] in
                                          if let controller = self {
                                    
                                              
                                              
                                              
                                          }
                                      }, completion: nil)
           
        UIView.animate(
        withDuration: 0.7, delay: 0.2, options: [],
                            animations: { [weak self] in
                                if let controller = self {
                                 
                                 
                                 
                                  
                                    
                                    
                                    
                                }
                            }, completion: nil)
        
    }
    override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
         
         
          self.view.addSubview(shade)
                         shade.backgroundColor = .black
                         shade.frame.size.width = screenWidth
                          shade.frame.size.height = screenHeight
                       shade.alpha = 0.0
         super.drawMenuOnTop()
         
          
          // swiftlint:disable:next line_length
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
}
