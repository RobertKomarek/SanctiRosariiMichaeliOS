//
//  VerticallyCenteredTextView.swift
//  ErzengelMichael
//
//  Created by Marina Komarek on 03.11.22.
//

import UIKit


class VerticallyCenteredTextView: UITextView {
    override var contentSize: CGSize {
        didSet {
            var topCorrection = (bounds.size.height - contentSize.height * zoomScale) / 2.0
            topCorrection = max(0, topCorrection)
            contentInset = UIEdgeInsets(top: topCorrection, left: 0, bottom: 0, right: 0)
        }
    }
}

