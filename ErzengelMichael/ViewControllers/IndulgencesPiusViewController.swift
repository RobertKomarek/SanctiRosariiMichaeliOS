//
//  IndulgencesPiusViewController.swift
//  ErzengelMichael
//
//  Created by Marina Komarek on 19.11.22.
//

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
        
//        switch language {
//            //Check chosen language Deutsch, Englisch, Español, Italiano, Português, Français
//        case "Deutsch":
//            let backButton = UIBarButtonItem()
//            backButton.title = "Versprechungen"
//            backButton.tintColor = .white
//            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
//        case "English":
//            let backButton = UIBarButtonItem()
//            backButton.title = "Promises"
//            backButton.tintColor = .white
//            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
//        case "Español":
//            let backButton = UIBarButtonItem()
//            backButton.title = "Promesas"
//            backButton.tintColor = .white
//            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
//        case "Italiano":
//            let backButton = UIBarButtonItem()
//            backButton.title = "Promesse"
//            backButton.tintColor = .white
//            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
//        case "Português":
//            let backButton = UIBarButtonItem()
//            backButton.title = "Promessas"
//            backButton.tintColor = .white
//            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
//        case "Français":
//            let backButton = UIBarButtonItem()
//            backButton.title = "Promesses"
//            backButton.tintColor = .white
//            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
//        case "中文":
//            let backButton = UIBarButtonItem()
//            backButton.title = "承诺"
//            backButton.tintColor = .white
//            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
//        default:
//            let backButton = UIBarButtonItem()
//            backButton.title = "Promises"
//            backButton.tintColor = .white
//            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
//        }
        
        self.navigationItem.title = arrayAppDetails[0].TitlePromisesIndulgences
        textViewIndulgences.text = arrayAppDetails[0].PromisesIndulgences
        
    }
}
