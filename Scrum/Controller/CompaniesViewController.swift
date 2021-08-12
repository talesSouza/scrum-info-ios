import UIKit

class CompaniesViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var companiesCollectionView: UICollectionView!
    @IBOutlet weak var topQuestionLabel: UILabel!
    @IBOutlet weak var bottomQuestionLabel: UILabel!
    
    // MARK: - Properties
    let companiesPhotos: [UIImage] = [#imageLiteral(resourceName: "spotify"), #imageLiteral(resourceName: "google"), #imageLiteral(resourceName: "apple"), #imageLiteral(resourceName: "facebook")]
    var user: User?
}
    
// MARK: - LifeCycle
extension CompaniesViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}

// MARK: - Setup
extension CompaniesViewController {
    
    private func setupLayout() {
        if let user = user,
           let age = Float(user.age) {
            
            let finalAge = (age + 5)
            topQuestionLabel.text = "Wanna work here, \(user.name)?"
            bottomQuestionLabel.text = "Which one you gonna be with \(String(format: "%.0f", finalAge)) years old?"
        }
    }
}

// MARK: - UICollectionViewDelegate
extension CompaniesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return companiesPhotos.count
    }
}

// MARK: - UICollectionViewDataSource
extension CompaniesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = companiesCollectionView.dequeueReusableCell(withReuseIdentifier: "companyCell", for: indexPath as IndexPath) as! CompanyCollectionViewCell
        cell.photo.image = companiesPhotos[indexPath.row]
        return cell
    }
}
