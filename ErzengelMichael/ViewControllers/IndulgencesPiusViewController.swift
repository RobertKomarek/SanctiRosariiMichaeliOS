//
//  IndulgencesPiusViewController.swift
//  ErzengelMichael
//
//  Created by Marina Komarek on 19.11.22.
//

import UIKit

class IndulgencesPiusViewController: UIViewController {
    
    var passedArray:[AppDetails]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        
        self.title = passedArray[0].TitlePromisesIndulgences
        //self.navigationItem.backButtonTitle = " "
    }
}
