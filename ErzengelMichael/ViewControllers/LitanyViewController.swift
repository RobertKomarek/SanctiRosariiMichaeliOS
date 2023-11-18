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
    
    var passedArray:[AppDetails] = []
    let appDetails = AppDetails()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateText()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        updateText()
    }
    
    private func updateText() {
        let defaults = UserDefaults.standard
        let language = defaults.string(forKey: "Language")
        passedArray = appDetails.getAppDetails(jsonName: "SanctiRosariiMichael", language: language ?? "English")
        
        self.navigationItem.title = passedArray[0].TitlePrayersLitany
        textViewLitany.text = passedArray[0].PrayersLitany
        
        let backButton = UIBarButtonItem()
        backButton.title = passedArray[0].TitlePrayersLeo
        backButton.tintColor = .white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }

}
