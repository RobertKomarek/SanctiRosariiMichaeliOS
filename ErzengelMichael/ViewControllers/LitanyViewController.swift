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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*imageViewLitany.layer.cornerRadius = 10
        imageViewLitany.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]*/
    
//
//        let defaults = UserDefaults.standard
//        let language = defaults.string(forKey: "Language")
        
        let backButton = UIBarButtonItem()
        backButton.title = passedArray[0].TitlePrayersLeo
        backButton.tintColor = .white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        /*switch language {
        //Check chosen language Deutsch, Englisch, Español, Italiano, Português, Français
        case "Deutsch":
            let backButton = UIBarButtonItem()
            backButton.title = passedArray[0].TitlePrayersLeo
            backButton.tintColor = .white
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        case "English":
            let backButton = UIBarButtonItem()
            backButton.title = passedArray[0].TitlePrayersLeo
            backButton.tintColor = .white
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        case "Español":
            let backButton = UIBarButtonItem()
            backButton.title = passedArray[0].TitlePrayersLeo
            backButton.tintColor = .white
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        case "Italiano":
            let backButton = UIBarButtonItem()
            backButton.title = passedArray[0].TitlePrayersLeo
            backButton.tintColor = .white
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        case "Português":
            let backButton = UIBarButtonItem()
            backButton.title = passedArray[0].TitlePrayersLeo
            backButton.tintColor = .white
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        case "Français":
            let backButton = UIBarButtonItem()
            backButton.title = passedArray[0].TitlePrayersLeo
            backButton.tintColor = .white
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        case "Chinese":
            let backButton = UIBarButtonItem()
            backButton.title = passedArray[0].TitlePrayersLeo
            backButton.tintColor = .white
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        default:
            let backButton = UIBarButtonItem()
            backButton.title = passedArray[0].TitlePrayersLeo
            backButton.tintColor = .white
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        }*/

    }
    

    override func viewDidAppear(_ animated: Bool) {
        
        self.navigationItem.title = passedArray[0].TitlePrayersLitany
        textViewLitany.text = passedArray[0].PrayersLitany
        //textViewIndulgences.text = passedArray[0].PromisesIndulgences
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
