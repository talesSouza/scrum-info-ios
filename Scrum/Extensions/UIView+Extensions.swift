import UIKit

extension UIView {
    
    func setupBorder(borderWidth: CGFloat = 1,
                     borderColor: UIColor = .white,
                     cornerRadius: CGFloat = 5) {
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        layer.cornerRadius = cornerRadius
    }
}
