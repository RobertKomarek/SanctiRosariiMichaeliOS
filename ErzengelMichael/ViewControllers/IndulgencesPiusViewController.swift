import UIKit

class IndulgencesPiusViewController: UIViewController {
    
    //var passedArray:[AppDetails] = []
    var arrayAppDetails: [AppDetails] = []
    let appDetails = AppDetails()
    @IBOutlet weak var textViewIndulgences: UITextView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        updateText()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateText()
    }

    override func viewDidAppear(_ animated: Bool) {
        updateText()
    }
    
    private func updateText() {
        let defaults = UserDefaults.standard
        let language = defaults.string(forKey: "Language")
        
        //Load Json file with app details
        arrayAppDetails = appDetails.getAppDetails(jsonName: "SanctiRosariiMichael", language: language ?? "English")
        
        let backButton = UIBarButtonItem()
        backButton.title = arrayAppDetails[0].TabBarPromises
        backButton.tintColor = .white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
 
        
        self.navigationItem.title = arrayAppDetails[0].TitlePromisesIndulgences
        textViewIndulgences.text = arrayAppDetails[0].PromisesIndulgences
        
    }
}
