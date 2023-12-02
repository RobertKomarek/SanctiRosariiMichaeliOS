//
//  LitanyViewController.swift
//  ErzengelMichael
//
//  Created by Marina Komarek on 26.11.22.
//

import UIKit

class LitanyViewController: UIViewController {
    
    @IBOutlet weak var textViewLitany: UITextView!
    @IBOutlet weak var imageViewLitany: UIImageView!
    
    //var passedArray: [AppDetails] = []
    var arrayAppDetails: [AppDetails] = []
    let appDetails = AppDetails()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateText()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        updateText()
        
        //Bei Neustart der App checken ob die FontSize geändert wurde und entsprechend den Labels im Array zuweisen
        if let fontSize = UserDefaults.standard.value(forKey: "fontSize") as? CGFloat {
            textViewLitany.font = UIFont.systemFont(ofSize: fontSize)
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
        
        self.navigationItem.title = arrayAppDetails[0].TitlePrayersLitany
        textViewLitany.text = arrayAppDetails[0].PrayersLitany
        
        let backButton = UIBarButtonItem()
        backButton.title = arrayAppDetails[0].TitlePrayersLeo
        backButton.tintColor = .white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }

}
