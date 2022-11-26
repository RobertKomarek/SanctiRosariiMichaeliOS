//
//  PromisesViewController.swift
//  ErzengelMichael
//
//  Created by Marina Komarek on 26.10.22.
//

import UIKit

class PromisesMichaelViewController: UIViewController {
    
    let appDetails = AppDetails()
    var rosaryChosenLanguage:[AppDetails] = []
    var arrayAppDetails:[AppDetails] = []
    var indulgencesPiusViewController = IndulgencesPiusViewController()
    
    @IBOutlet weak var textViewPromisesMichael: UITextView!
    @IBOutlet weak var buttonGoToIndulgences: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //Check chosen language Deutsch, Englisch, Español, Italiano, Português, Français
        let defaults = UserDefaults.standard
        let language = defaults.string(forKey: "Language")
        
        //Load Json file with app details
        arrayAppDetails = appDetails.getAppDetails(jsonName: "SanctiRosariiMichael", language: language!)
                
        //Set Navigation Bar Title
        //self.navigationItem.backBarButtonItem?.title = "Go Back"
        self.navigationItem.title = arrayAppDetails[0].TabBarPromises
        //self.navigationItem.backButtonTitle = "Go BAck"
        
        textViewPromisesMichael.text = arrayAppDetails[0].PromisesMichael
        buttonGoToIndulgences.setTitle(arrayAppDetails[0].TitlePromisesIndulgences, for: .normal)
    }
    
    //Passing data to Indulgences Pius XI Navigation Item
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showIndulgences" {
            indulgencesPiusViewController = segue.destination as! IndulgencesPiusViewController
            //passeArray created in destination ViewController IndulgencesPiusViewController
            indulgencesPiusViewController.passedArray = arrayAppDetails
        }
    }
}


