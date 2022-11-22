//
//  IndulgencesPiusViewController.swift
//  ErzengelMichael
//
//  Created by Marina Komarek on 19.11.22.
//

import UIKit

class IndulgencesPiusViewController: UIViewController {
    
    var passedArray:[AppDetails]!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        let language = defaults.string(forKey: "Language")
        
        switch language {
        //Check chosen language Deutsch, Englisch, Español, Italiano, Português, Français
        case "Deutsch":
            let backButton = UIBarButtonItem()
            backButton.title = "Versprechungen"
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        case "English":
            let backButton = UIBarButtonItem()
            backButton.title = "Promises"
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        case "Español":
            let backButton = UIBarButtonItem()
            backButton.title = "Promesas"
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        case "Italiano":
            let backButton = UIBarButtonItem()
            backButton.title = "Promesse"
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        case "Português":
            let backButton = UIBarButtonItem()
            backButton.title = "Promessas"
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        case "Français":
            let backButton = UIBarButtonItem()
            backButton.title = "Promesses"
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        default:
            let backButton = UIBarButtonItem()
            backButton.title = "Promises"
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        self.navigationItem.title = passedArray[0].TitlePromisesIndulgences
        //self.navigationItem.backButtonTitle = "Go BAck"
        /*self.navigationItem.backButtonTitle = "Go Back"
        self.navigationItem.backBarButtonItem?.title = "Go Back"*/
        //self.navigationItem.backButtonTitle = " "
    }
}
