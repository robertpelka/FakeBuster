//
//  FirstViewController.swift
//  FakeBuster
//
//  Created by Robert Pelka on 07/03/2021.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var pasteButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView.layer.cornerRadius = 15
        checkButton.layer.cornerRadius = 10
        pasteButton.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        pasteButton.layer.cornerRadius = 13
    }
    
}
