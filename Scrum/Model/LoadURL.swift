import UIKit

extension InitialViewController {
    
    public func loadURL() {
        if let url = URL(string: "https://www.scrum.org/professional-scrum-certifications/professional-scrum-master-assessments"),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:])
        }
    }
}
