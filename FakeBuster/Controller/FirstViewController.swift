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
    @IBOutlet weak var urlTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView.layer.cornerRadius = 15
        pasteButton.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        pasteButton.layer.cornerRadius = 13
        checkButton.layer.cornerRadius = 10
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func pasteButtonPressed(_ sender: UIButton) {
        urlTextField.text = UIPasteboard.general.string
    }
    
}
