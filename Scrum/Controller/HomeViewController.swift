import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userAgeTextField: UITextField!
    @IBOutlet weak var topQuestionLabel: UILabel!
    @IBOutlet weak var bottomQuestionLabel: UILabel!
    @IBOutlet weak var learnScrumButton: UIButton!
    @IBOutlet weak var scrumMasterButton: UIButton!
    @IBOutlet weak var scrumUsersButton: UIButton!
    
    var buttons: [UIButton] {
        [learnScrumButton, scrumUsersButton, scrumMasterButton]
    }
    
    // MARK: - Properties
    let principlesService = PrinciplesService()
    var user = User()
}

// MARK: - LifeCycle
extension HomeViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

// MARK: - Setup
extension HomeViewController {
    
    private func setupLayout() {
        buttons.forEach { $0.setupBorder() }
        userNameTextField.delegate = self
    }
}

// MARK: - Navigation
extension HomeViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CompaniesViewController {
            vc.user = user
        }
    }
}

// MARK: - IBActions
extension HomeViewController {
    
    @IBAction func openScrumMasterURLTouchUpInside(_ sender: UIButton) {
        loadScrumMasterURL()
    }
}

// MARK: - UITextFieldDelegate
extension HomeViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        userNameTextField.resignFirstResponder()
        userAgeTextField.resignFirstResponder()
        
        if let userName = userNameTextField.text, let userAge = userAgeTextField.text {
            user.name = userName
            user.age = userAge
        }
        return true
    }
}

// MARK: - SrumMasterURL
extension HomeViewController {
    
    public func loadScrumMasterURL() {
        if let url = URL(string: "https://www.scrum.org/professional-scrum-certifications/professional-scrum-master-assessments"),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:])
        }
    }
}
