//
//  SecondResultViewController.swift
//  FakeBuster
//
//  Created by Robert Pelka on 12/03/2021.
//

import UIKit
import CoreML
import Vision

class SecondResultViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var procentLabel: UILabel!
    @IBOutlet weak var goBackButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var choosenImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        goBackButton.layer.cornerRadius = 10
        
        if let image = choosenImage {
            imageView.image = image
            classify(image: image)
        }
    }
    
    func classify(image: UIImage) {
        guard let model = try? VNCoreMLModel(for: ImageManipulationClassifier(configuration: MLModelConfiguration()).model) else {
            fatalError("Loading CoreML model failed.")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Model failes to process image.")
            }
            
            if let firstResult = results.first {
                self.resultLabel.text = firstResult.identifier.uppercased()
                self.procentLabel.text = "(" + String(format: "%.2f",firstResult.confidence * 100) + "% CERTAINTY)"
                if firstResult.identifier == "original" {
                    self.backgroundImage.image = UIImage(named: "greenGradient")
                }
                else {
                    self.backgroundImage.image = UIImage(named: "redGradient")
                }
            }
        }
        
        guard let ciImage = CIImage(image: image) else {
            fatalError("Failed to convert UIImage to CIIMage")
        }
        
        let handler = VNImageRequestHandler(ciImage: ciImage)
        
        do {
            try handler.perform([request])
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func goBackButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
