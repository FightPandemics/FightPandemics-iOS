
import UIKit

class LargeText: UITextView {
    weak var parentVC: BaseViewController!
    init(_ parentVC: BaseViewController, text: String) {
        self.parentVC = parentVC
        super.init(frame: CGRect(), textContainer: nil)
        self.text = text
        var fontSize: CGFloat = 36
      
        
        self.font = UIFont.boldSystemFont(ofSize: 16.0)
        self.textColor = UIColor.Primary.Gray
        self.frame.size.width = contentMaxWidth
        self.frame.size.height = self.contentSize.height
        self.isEditable = false
        self.backgroundColor = .clear
        self.isSelectable = false
        // accessibility
        self.accessibilityIdentifier = AccessibilityIdentifier.Content.rawValue
    }

    func draw(centerX: CGFloat, centerY: CGFloat) {
        self.center.x = centerX
        self.center.y = centerY
        parentVC.view.addSubview(self)
    }

    func draw(centerX: CGFloat, originY: CGFloat) {
        self.center.x = centerX
        self.frame.origin.y = originY
        parentVC.view.addSubview(self)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
