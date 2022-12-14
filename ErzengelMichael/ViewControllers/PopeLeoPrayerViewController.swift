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
   
    override func viewDidAppear(_ animated: Bool)  {
        //Check chosen language Deutsch, Englisch, Español, Italiano, Português, Français
        let defaults = UserDefaults.standard
        let language = defaults.string(forKey: "Language")
        
        //Load Json file with app details
        arrayAppDetails = appDetails.getAppDetails(jsonName: "SanctiRosariiMichael", language: language ?? "English")
                
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLitany" {
            litanyViewController = segue.destination as! LitanyViewController
            //passeArray created in destination ViewController IndulgencesPiusViewController
            litanyViewController.passedArray = arrayAppDetails
        }
    }

}
