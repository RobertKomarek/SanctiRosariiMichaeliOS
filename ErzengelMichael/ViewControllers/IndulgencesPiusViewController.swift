//
//  IndulgencesPiusViewController.swift
//  ErzengelMichael
//
//  Created by Marina Komarek on 19.11.22.
//

import UIKit

class IndulgencesPiusViewController: UIViewController {
    
    var passedArray:[AppDetails]!

    @IBOutlet weak var textViewIndulgences: UITextView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        let language = defaults.string(forKey: "Language")
        
        switch language {
        //Check chosen language Deutsch, Englisch, Español, Italiano, Português, Français
        case "Deutsch":
            let backButton = UIBarButtonItem()
            backButton.title = "Versprechungen"
            backButton.tintColor = .white
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        case "English":
            let backButton = UIBarButtonItem()
            backButton.title = "Promises"
            backButton.tintColor = .white
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        case "Español":
            let backButton = UIBarButtonItem()
            backButton.title = "Promesas"
            backButton.tintColor = .white
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        case "Italiano":
            let backButton = UIBarButtonItem()
            backButton.title = "Promesse"
            backButton.tintColor = .white
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        case "Português":
            let backButton = UIBarButtonItem()
            backButton.title = "Promessas"
            backButton.tintColor = .white
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        case "Français":
            let backButton = UIBarButtonItem()
            backButton.title = "Promesses"
            backButton.tintColor = .white
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        case "中文":
            let backButton = UIBarButtonItem()
            backButton.title = "承诺"
            backButton.tintColor = .white
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        default:
            let backButton = UIBarButtonItem()
            backButton.title = "Promises"
            backButton.tintColor = .white
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        
        self.navigationItem.title = passedArray[0].TitlePromisesIndulgences
        textViewIndulgences.text = passedArray[0].PromisesIndulgences
        //self.navigationItem.backButtonTitle = "Go BAck"
        /*self.navigationItem.backButtonTitle = "Go Back"
        self.navigationItem.backBarButtonItem?.title = "Go Back"*/
        //self.navigationItem.backButtonTitle = " "
    }
}
