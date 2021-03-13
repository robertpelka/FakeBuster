//
//  FirstResultViewController.swift
//  FakeBuster
//
//  Created by Robert Pelka on 11/03/2021.
//

import UIKit
import SwiftSoup
import CoreML

class FirstResultViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var goBackButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var urlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        goBackButton.layer.cornerRadius = 10
        
        getNews()
    }
    
    func getNews() {
        guard let urlUnwrapped = urlString else {
            fatalError("An error occurred while unwrapping urlString.")
        }
        if let url = URL(string: urlUnwrapped) {
            do {
                let html = try String(contentsOf: url)
                let document = try SwiftSoup.parse(html)

                if let title = try document.select("h1").first() {
                    let titleText = try title.text()
                    titleLabel.text = titleText
                    classify(newsTitle: titleText)
                }
                else {
                    titleLabel.text = "Could't get the title"
                }
                
                if let content = try document.select("p").first() {
                    contentLabel.text = try content.text()
                }
                else {
                    contentLabel.text = "Couldn't get the content of the news."
                }
            } catch {
                titleLabel.text = "Could't get the title"
                contentLabel.text = "Couldn't get the content of the news.\n\nPlease check the entered website address. A\u{00a0}typical URL could have the form:\nhttp://www.example.com/index.html."
            }
        }
        else {
            titleLabel.text = "Invalid URL"
            contentLabel.text = "A typical URL could have the form:\nhttp://www.example.com/index.html."
        }
    }
    
    func classify(newsTitle: String) {
        do {
            let prediction = try FakeNewsClassifier(configuration: MLModelConfiguration()).prediction(text: newsTitle)
            descriptionLabel.text = "THIS IS PROBABLY A"
            if(prediction.label == "fake") {
                resultLabel.text = "FAKE NEWS"
                backgroundImage.image = UIImage(named: "redGradient")
            }
            else {
                resultLabel.text = "REAL NEWS"
                backgroundImage.image = UIImage(named: "greenGradient")
            }
        }
        catch {
            print("Error: Coulnd't make a prediction")
        }
    }

    @IBAction func goBackButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
