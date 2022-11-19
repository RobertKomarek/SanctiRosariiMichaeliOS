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
        //Load Json file with app details
        arrayAppDetails = appDetails.getAppDetails(jsonName: "SanctiRosariiMichael")
                
        //Check chosen language Deutsch, Englisch, Español, Italiano, Português, Français
        let defaults = UserDefaults.standard
        let language = defaults.string(forKey: "Language")
        //Check if language was changed != nil otherwise use English as default value
        if language != nil {
            if rosaryChosenLanguage.isEmpty {
                for rosary in arrayAppDetails {
                    if rosary.Language == language {
                        rosaryChosenLanguage.append(rosary)
                    }
                }
            } else {
                rosaryChosenLanguage.removeAll()
                for rosary in arrayAppDetails {
                    if rosary.Language == language {
                        rosaryChosenLanguage.append(rosary)
                    }
                }
            }
        } else {
            //Use English as defaul value
            for rosary in arrayAppDetails {
                if rosary.Language == "English" {
                    rosaryChosenLanguage.append(rosary)
                }
            }
        }
                
        //Set Navigation Bar Title 
        self.title = rosaryChosenLanguage[0].TitlePromisesMichael
        /*if let navBarItem0 = self.navigationController?.navigationBar.items?[0] {
            navBarItem0.title = rosaryChosenLanguage[0].TitlePromisesMichael
        }*/
        
        textViewPromisesMichael.text = rosaryChosenLanguage[0].PromisesMichael
        buttonGoToIndulgences.setTitle(rosaryChosenLanguage[0].TitlePromisesIndulgences, for: .normal)
    }
    
    //Passing data to Indulgences Pius XI Navigation Item
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showIndulgences" {
            indulgencesPiusViewController = segue.destination as! IndulgencesPiusViewController
            //passeArray created in destination ViewController IndulgencesPiusViewController
            indulgencesPiusViewController.passedArray = rosaryChosenLanguage
        }
    }
}


