//
//  SecondViewController.swift
//  FakeBuster
//
//  Created by Robert Pelka on 11/03/2021.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var pasteButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundView.layer.cornerRadius = 15
        imageView.layer.cornerRadius = 5
        chooseButton.layer.cornerRadius = 13
        pasteButton.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        pasteButton.layer.cornerRadius = 13
        checkButton.layer.cornerRadius = 10
    }

}
