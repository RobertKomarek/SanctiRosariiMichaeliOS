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
        //Receiving array from PromisesMichaelViewController
        //passedArray = Array()
        
        self.title = passedArray[0].TitlePromisesIndulgences
    }
}
