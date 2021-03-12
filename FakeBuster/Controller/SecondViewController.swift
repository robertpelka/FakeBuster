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
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
        backgroundView.layer.cornerRadius = 15
        imageView.layer.cornerRadius = 5
        chooseButton.layer.cornerRadius = 13
        pasteButton.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        pasteButton.layer.cornerRadius = 13
        checkButton.layer.cornerRadius = 10
    }
    
    @IBAction func pasteButtonPressed(_ sender: UIButton) {
        if let pasteboardImage = UIPasteboard.general.image {
            imageView.image = pasteboardImage
        }
    }
    
    @IBAction func checkButtonPressed(_ sender: UIButton) {
        if (imageView.image != nil) {
            performSegue(withIdentifier: K.Segues.image, sender: self)            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == K.Segues.image), let image = imageView.image {
            let secondResultVC = segue.destination as! SecondResultViewController
            secondResultVC.choosenImage = image
        }
    }
    
}

extension SecondViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBAction func chooseButtonPressed(_ sender: UIButton) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let choosenImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = choosenImage
            imagePicker.dismiss(animated: true, completion: nil)
        }
    }
}
