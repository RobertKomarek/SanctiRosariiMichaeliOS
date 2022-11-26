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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var textViewPrayerLeo: UITextView!
    @IBOutlet weak var buttonGoToLitany: UIButton!
   
    override func viewDidAppear(_ animated: Bool) {
        //Check chosen language Deutsch, Englisch, Español, Italiano, Português, Français
        let defaults = UserDefaults.standard
        let language = defaults.string(forKey: "Language")
        
        //Load Json file with app details
        arrayAppDetails = appDetails.getAppDetails(jsonName: "SanctiRosariiMichael", language: language!)
                
        //Set Navigation Bar Title
        self.navigationItem.title = arrayAppDetails[0].TitlePrayersLeo
        
        buttonGoToLitany.setTitle(arrayAppDetails[0].TitlePrayersLitany, for: .normal)
        textViewPrayerLeo.text = arrayAppDetails[0].PrayersLeo
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLitany" {
            litanyViewController = segue.destination as! LitanyViewController
            //passeArray created in destination ViewController IndulgencesPiusViewController
            litanyViewController.passedArray = arrayAppDetails
        }
    }

}
