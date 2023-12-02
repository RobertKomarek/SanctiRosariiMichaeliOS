//
//  PromisesViewController.swift
//  ErzengelMichael
//
//  Created by Marina Komarek on 26.10.22.
//

import UIKit

class PromisesMichaelViewController: UIViewController {
    
    let appDetails = AppDetails()
    var rosaryChosenLanguage: [AppDetails] = []
    var arrayAppDetails: [AppDetails] = []
    var indulgencesPiusViewController = IndulgencesPiusViewController()
    
    @IBOutlet weak var textViewPromisesMichael: UITextView!
    @IBOutlet weak var buttonGoToIndulgences: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateText()
        
        //Bei Neustart der App checken ob die FontSize geändert wurde und entsprechend den Labels im Array zuweisen
        if let fontSize = UserDefaults.standard.value(forKey: "fontSize") as? CGFloat {
            textViewPromisesMichael.font = UIFont.systemFont(ofSize: fontSize)
        }
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
        
        self.navigationItem.title = arrayAppDetails[0].TabBarPromises

        textViewPromisesMichael.text = arrayAppDetails[0].PromisesMichael
        buttonGoToIndulgences.setTitle(arrayAppDetails[0].TitlePromisesIndulgences, for: .normal)
        
    }
    
    //Passing data to Indulgences Pius XI Navigation Item
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showIndulgences" {
//            indulgencesPiusViewController = segue.destination as! IndulgencesPiusViewController
//            //passeArray created in destination ViewController IndulgencesPiusViewController
//            indulgencesPiusViewController.passedArray = arrayAppDetails
//        }
//    }
}


