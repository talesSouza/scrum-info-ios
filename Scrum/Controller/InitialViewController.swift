import UIKit

class InitialViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userAgeTextField: UITextField!
    @IBOutlet weak var topQuestionLabel: UILabel!
    @IBOutlet weak var bottomQuestionLabel: UILabel!
    @IBOutlet weak var learnScrumButton: UIButton!
    @IBOutlet weak var scrumMasterButton: UIButton!
    @IBOutlet weak var scrumUsersButton: UIButton!
    
    // MARK: - Properties
    let principlesService = PrinciplesService()
    var user = User()
}

// MARK: - LifeCycle
extension InitialViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        settingObjects()
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

// MARK: - Functions
extension InitialViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ScrumUsersViewController {
            vc.user = user
        }
    }
    
    func settingObjects() {
        settingObject(object: learnScrumButton)
        settingObject(object: scrumMasterButton)
        settingObject(object: scrumUsersButton)
    }
}

// MARK: - IBActions
extension InitialViewController {
    
    @IBAction func openScrumMasterURLTouchUpInside(_ sender: UIButton) {
        loadScrumMasterURL()
    }
}

// MARK: - UITextFieldDelegate
extension InitialViewController: UITextFieldDelegate {
    
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
extension InitialViewController {
    
    public func loadScrumMasterURL() {
        if let url = URL(string: "https://www.scrum.org/professional-scrum-certifications/professional-scrum-master-assessments"),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:])
        }
    }
}


extension InitialViewController {
    func settingObject(object: AnyObject, width: CGFloat = 1, radius: CGFloat = 5, color: UIColor = .white) {
        object.layer?.cornerRadius = radius
        object.layer?.borderWidth = width
        object.layer?.borderColor = color.cgColor
    }
}
