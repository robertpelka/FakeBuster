//
//  SecondResultViewController.swift
//  FakeBuster
//
//  Created by Robert Pelka on 12/03/2021.
//

import UIKit

class SecondResultViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var procentLabel: UILabel!
    @IBOutlet weak var goBackButton: UIButton!
    
    var choosenImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        goBackButton.layer.cornerRadius = 10
        
        if let image = choosenImage {
            imageView.image = image
        }
    }
    
    @IBAction func goBackButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
