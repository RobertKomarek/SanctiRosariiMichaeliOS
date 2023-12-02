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
        
        //Bei Neustart der App checken ob die FontSize geändert wurde und entsprechend den Labels im Array zuweisen
        if let fontSize = UserDefaults.standard.value(forKey: "fontSize") as? CGFloat {
            textViewIndulgences.font = UIFont.systemFont(ofSize: fontSize)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        updateText()
    }
    
    private func updateText() {
        let defaults = UserDefaults.standard
        if let language = defaults.string(forKey: "Language") {
            //Load Json file with app details if preferred Language of Device has been changed and saved to UserDefauls
            arrayAppDetails = appDetails.getAppDetails(jsonName: "SanctiRosariiMichael", language: language)
        } else {
            //otherwise load the preferred Language according to Device
            arrayAppDetails = appDetails.getAppDetails(jsonName: "SanctiRosariiMichael", language: UsedDevice.languageCode())
        }
        
        let backButton = UIBarButtonItem()
        backButton.title = arrayAppDetails[0].TabBarPromises
        backButton.tintColor = .white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        self.navigationItem.title = arrayAppDetails[0].TitlePromisesIndulgences
        textViewIndulgences.text = arrayAppDetails[0].PromisesIndulgences
        
    }
}
