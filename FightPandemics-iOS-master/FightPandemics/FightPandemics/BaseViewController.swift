

import UIKit

class BaseViewController: UIViewController {
    var header: Header!

    override func viewDidLoad() {
        self.header = Header(self)
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        Header must be drawn here instead of viewDidLoad(), because it makes use
//        of view.safeAreaInsets.top which isn't filled out until this point in the
//        ViewController life cycle.
        self.header.draw()
    }

    // Call this function at the end of child's viewDidLayoutSubviews() to draw the menu
    // with the items on top of everything else.
    func drawMenuOnTop() {
        self.header.menu?.draw()
    }
}
