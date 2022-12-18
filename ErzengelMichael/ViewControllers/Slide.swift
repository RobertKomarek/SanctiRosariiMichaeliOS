//
//  Slide.swift
//  ErzengelMichael
//
//  Created by Marina Komarek on 15.10.22.
//

import UIKit

class Slide: UIImageView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    /*override func draw(_ rect: CGRect) {
        /*let gradient = CAGradientLayer()
        
        gradient.frame = gradientView.bounds
        gradient.colors = [
            UIColor.white.cgColor,
            UIColor.black.cgColor
        ]
        gradient.locations = [0, 0.5]
        
        gradientView.layer.insertSublayer(gradient, at: 0)*/
        
        
        let gradient = CAGradientLayer()
        gradient.frame = gradientView.bounds
        //gradient.contents = gradientView.image?.cgImage
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.startPoint = CGPoint(x: 0, y:0)
        gradient.endPoint = CGPoint(x: 1, y:1)
        gradient.locations = [0, 0.5]
        gradientView.layer.addSublayer(gradient)
    }*/

}

