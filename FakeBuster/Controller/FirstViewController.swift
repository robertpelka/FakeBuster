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
        
        urlTextField.delegate = self
        
        backgroundView.layer.cornerRadius = 15
        pasteButton.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        pasteButton.layer.cornerRadius = 13
        checkButton.layer.cornerRadius = 10
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func pasteButtonPressed(_ sender: UIButton) {
        if let pasteboardString = UIPasteboard.general.string {
            urlTextField.text = pasteboardString
        }
    }
    
    @IBAction func checkButtonPressed(_ sender: UIButton) {
        if (urlTextField.text != "") {
            performSegue(withIdentifier: K.Segues.news, sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == K.Segues.news) {
            let firstResultVC = segue.destination as! FirstResultViewController
            firstResultVC.urlString = urlTextField.text
        }
    }
    
}

extension FirstViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
