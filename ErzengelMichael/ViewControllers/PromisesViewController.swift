//
//  PromisesViewController.swift
//  ErzengelMichael
//
//  Created by Marina Komarek on 26.10.22.
//

import UIKit

class PromisesViewController: UIViewController {
    
    let appDetails = AppDetails()
    var rosaryChosenLanguage:[AppDetails] = []
    var arrayAppDetails:[AppDetails] = []
    
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
        
        rosaryChosenLanguage = appDetails.getAppDetails(jsonName: "SanctiRosariiMichael")
        
        if let navBarItem0 = self.navigationController?.navigationBar.items?[0] {
            navBarItem0.title = rosaryChosenLanguage[0].TitlePromisesMichael
        }
        
        textViewPromisesMichael.text = rosaryChosenLanguage[0].PromisesMichael
        buttonGoToIndulgences.setTitle(rosaryChosenLanguage[0].TitlePromisesIndulgences, for: .normal)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
