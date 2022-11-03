//
//  SettingsViewController.swift
//  ErzengelMichael
//
//  Created by Marina Komarek on 16.10.22.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //@IBOutlet weak var stackViewHeader: UIStackView!
    @IBOutlet weak var buttonLanguageConfirmed: UIButton!
    @IBOutlet weak var labelPickedLanguage: UILabel!
    @IBOutlet weak var pickerViewLanguages: UIPickerView!
    
    var flagsTag:Int = 0
    
    var arrayFlags:[UIImage]=[UIImage(named: "langEnglish")!, UIImage(named: "langFrench")!, UIImage(named: "langGerman")!, UIImage(named: "langSpanish")!, UIImage(named: "langPortugese")!, UIImage(named: "langItalian")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerViewLanguages.delegate = self
        pickerViewLanguages.dataSource = self
     
        /*stackViewHeader.layer.cornerRadius = 15
        stackViewHeader.layoutMargins = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        stackViewHeader.isLayoutMarginsRelativeArrangement = true*/
        
    }
    
    @IBAction func languageConfirmed(_ sender: UIButton, forEvent event: UIEvent) {
        
        let alert = UIAlertController(title: "Button klicked", message: "Language confirmed", preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
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
