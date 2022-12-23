//
//  SettingsViewController.swift
//  ErzengelMichael
//
//  Created by Marina Komarek on 16.10.22.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var appDetails = AppDetails()
    var arrayAppDetails:[AppDetails] = []
    //@IBOutlet weak var stackViewHeader: UIStackView!
    @IBOutlet weak var buttonLanguageConfirmed: UIButton!
    @IBOutlet weak var labelPickedLanguage: UILabel!
    @IBOutlet weak var pickerViewLanguages: UIPickerView!
    @IBOutlet weak var labelMailAddresse: UILabel!
    @IBOutlet weak var labelCreativeCommonsLicensed: UILabel!
    var flagsTag:Int = 0
    
    var arrayFlags:[UIImage]=[UIImage(named: "langEnglish")!, UIImage(named: "langFrench")!, UIImage(named: "langGerman")!, UIImage(named: "langSpanish")!, UIImage(named: "langPortugese")!, UIImage(named: "langItalian")!]
    
    @IBAction func languageConfirmed(_ sender: UIButton, forEvent event: UIEvent) {
        //Ausgewählte Sprache speichern und anschl. in viewDidLoad von Main/ViewController abfragen und die entsprechende Sprache laden
        let defaults = UserDefaults.standard
        defaults.set(labelPickedLanguage.text, forKey: "Language")
        let language = defaults.string(forKey: "Language")
        
        //Load Json file with app details
        arrayAppDetails = appDetails.getAppDetails(jsonName: "SanctiRosariiMichael", language: language!)
        
        //Update TabItems Title according to language
        if let tabBarItem0 = self.tabBarController?.tabBar.items?[0] {
            tabBarItem0.title = arrayAppDetails[0].TabBarRosary
        }
        if let tabBarItem1 = self.tabBarController?.tabBar.items?[1] {
            tabBarItem1.title = arrayAppDetails[0].TabBarPromises
        }
        if let tabBarItem2 = self.tabBarController?.tabBar.items?[2] {
            tabBarItem2.title = arrayAppDetails[0].TabBarPrayers
        }
        if let tabBarItem3 = self.tabBarController?.tabBar.items?[3] {
            tabBarItem3.title = arrayAppDetails[0].TabBarSettings
        }
        	
        //Update to respective language
        let alert = UIAlertController(title: "Button klicked", message: "Language \(language ?? "No language chosen") confirmed", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerViewLanguages.delegate = self
        pickerViewLanguages.dataSource = self
        
        let tabGestureRecognizerMail = UITapGestureRecognizer(target: self, action: #selector(self.labelMailAdresseTapped))
        labelMailAddresse.addGestureRecognizer(tabGestureRecognizerMail)
        labelMailAddresse.isUserInteractionEnabled = true
        
        let tabGestureRecognizerCreativeCommons = UITapGestureRecognizer(target: self, action: #selector(self.labelCreativeCommonsLicensedTapped))
        labelCreativeCommonsLicensed.addGestureRecognizer(tabGestureRecognizerCreativeCommons)
        labelCreativeCommonsLicensed.isUserInteractionEnabled = true
        /*stackViewHeader.layer.cornerRadius = 15
        stackViewHeader.layoutMargins = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        stackViewHeader.isLayoutMarginsRelativeArrangement = true*/
        
    }
    
    @objc func labelCreativeCommonsLicensedTapped (sender: UITapGestureRecognizer) {
        let creativeCommonsAdresse = "https://creativecommons.org/licenses/"
        if let url = URL(string: creativeCommonsAdresse) {
            UIApplication.shared.open(url)
                /*let alert = UIAlertController(title: "Please install Mail App on your device!", message: "Mail App required\(language ?? "No language chosen") confirmed", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)*/
        }
    }
    
    @objc func labelMailAdresseTapped(sender: UITapGestureRecognizer) {
        /*let mailClass: AnyClass? = (NSClassFromString("MFMailComposeViewController"))
        if (mailClass != nil)
        {
            if ([mailClass canSendMail])
            {
                [self displayComposerSheet];
            }
            else
            {
                [self launchMailAppOnDevice];
            }
        }
        else
        {
            [self launchMailAppOnDevice];
        }*/
        
        let emailAdresse = "robert.komarek98@gmail.com"
        if let url = URL(string: "mailto:\(emailAdresse)") {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
                /*let alert = UIAlertController(title: "Please install Mail App on your device!", message: "Mail App required\(language ?? "No language chosen") confirmed", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)*/
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayFlags.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 105
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch row {
        case 0:
            labelPickedLanguage.text = "English"
        case 1:
            labelPickedLanguage.text = "Français"
        case 2:
            labelPickedLanguage.text = "Deutsch"
        case 3:
            labelPickedLanguage.text = "Español"
        case 4:
            labelPickedLanguage.text = "Português"
        case 5:
            labelPickedLanguage.text = "Italiano"
        default:
            labelPickedLanguage.text = "Tap on Flag!"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let myFlagView = UIImageView(frame: CGRect(x: 0, y: 0, width: 220, height: 105))
        
        myFlagView.layer.cornerRadius = 15
        myFlagView.layer.masksToBounds = true
        
        myFlagView.image = arrayFlags[row]

        return myFlagView
    }
   
}
