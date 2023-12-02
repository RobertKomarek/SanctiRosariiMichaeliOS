//
//  PopeLeoPrayerViewController.swift
//  ErzengelMichael
//
//  Created by Marina Komarek on 26.11.22.
//

import UIKit



class PopeLeoPrayerViewController: UIViewController {
    
    var arrayAppDetails:[AppDetails] = []
    var appDetails = AppDetails()
    var litanyViewController = LitanyViewController()
    
    @IBOutlet weak var switchLatinNativeLanguage: UISwitch!
    @IBOutlet weak var textViewPrayerLeo: UITextView!
    @IBOutlet weak var buttonGoToLitany: UIButton!
    @IBOutlet weak var labelLatinNativeLanguage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //On/Off status color switch control
        switchLatinNativeLanguage.onTintColor = .lightGray
        switchLatinNativeLanguage.backgroundColor = .yellow
        switchLatinNativeLanguage.layer.cornerRadius = 15
        switchLatinNativeLanguage.clipsToBounds = true
        
     }
   
    override func viewWillAppear(_ animated: Bool) {
        updateText()
        
        //Bei Neustart der App checken ob die FontSize geändert wurde und entsprechend den Labels im Array zuweisen
        if let fontSize = UserDefaults.standard.value(forKey: "fontSize") as? CGFloat {
            // Get the current font of the UITextView
               if let currentFont = labelLatinNativeLanguage.font {
                   // Set the new font size while keeping the existing font family and style
                   let newFontSize: CGFloat = fontSize
                   let newFont = UIFont(name: currentFont.fontName, size: newFontSize)

                   // Set the new font to the UITextView
                   labelLatinNativeLanguage.font = newFont
               }
            //labelLatinNativeLanguage.font = UIFont.systemFont(ofSize: fontSize)
            textViewPrayerLeo.font = UIFont.systemFont(ofSize: fontSize)
        }
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        let mySwitch = sender
        if mySwitch.isOn {
            labelLatinNativeLanguage.text = arrayAppDetails[0].Language
            textViewPrayerLeo.text = arrayAppDetails[0].PrayersLeo
        } else {
            labelLatinNativeLanguage.text = "Latinus"
            textViewPrayerLeo.text = arrayAppDetails[0].PrayersLeoLatin
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
                
        //Set Navigation Bar Title, Button, TextView and Label
        self.navigationItem.title = arrayAppDetails[0].TitlePrayersLeo
        buttonGoToLitany.setTitle(arrayAppDetails[0].TitlePrayersLitany, for: .normal)
        textViewPrayerLeo.text = arrayAppDetails[0].PrayersLeo
        labelLatinNativeLanguage.text = arrayAppDetails[0].Language
        //On/Off status color switch control
        if switchLatinNativeLanguage.isOn {
            labelLatinNativeLanguage.text = arrayAppDetails[0].Language
            textViewPrayerLeo.text = arrayAppDetails[0].PrayersLeo
        } else {
            labelLatinNativeLanguage.text = "Latinus"
            textViewPrayerLeo.text = arrayAppDetails[0].PrayersLeoLatin
        }
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showLitany" {
//            litanyViewController = segue.destination as! LitanyViewController
//            //passeArray created in destination ViewController IndulgencesPiusViewController
//            litanyViewController.passedArray = arrayAppDetails
//        }
//    }

}
