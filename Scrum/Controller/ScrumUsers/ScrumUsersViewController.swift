import UIKit

class ScrumUsersViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var scrumUsersCollectionView: UICollectionView!
    @IBOutlet weak var topQuestionLabel: UILabel!
    @IBOutlet weak var bottomQuestionLabel: UILabel!
    
    // MARK: - Properties
    let userPhotos: [UIImage] = [#imageLiteral(resourceName: "spotify"), #imageLiteral(resourceName: "google"), #imageLiteral(resourceName: "apple"), #imageLiteral(resourceName: "facebook")]
    var user: User?
}
    
    // MARK: - IBOutlets
    extension ScrumUsersViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        askingUser()
    }
}

// MARK: - Functions
extension ScrumUsersViewController {
    func askingUser() {
        if let user = user, let age = Float(user.age) {
            let majorAge = (age + 5)
            
            topQuestionLabel.text = "Wanna work here, \(user.name)?"
            bottomQuestionLabel.text = "Which one you gonna be with \(String(format: "%.0f", majorAge)) years old?"
        }
    }
}

// MARK: - UICollectionViewDelegate
extension ScrumUsersViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userPhotos.count
    }
}

// MARK: - UICollectionViewDataSource
extension ScrumUsersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = scrumUsersCollectionView.dequeueReusableCell(withReuseIdentifier: "scrumUserCell", for: indexPath as IndexPath) as! ScrumUserCollectionViewCell
        
        cell.userPhoto.image = userPhotos[indexPath.row]
        
        return cell
    }
}
