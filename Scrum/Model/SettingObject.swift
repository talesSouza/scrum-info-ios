import UIKit

extension InitialViewController {
    func settingObject(object: AnyObject, width: CGFloat = 1, radius: CGFloat = 5, color: UIColor = .white) {
        object.layer?.cornerRadius = radius
        object.layer?.borderWidth = width
        object.layer?.borderColor = color.cgColor
    }
}
