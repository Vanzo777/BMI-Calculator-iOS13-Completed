//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 28/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    let calculatorBrain = CalculatorBrain()
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    
    private lazy var imageView: UIView = {
       let imageView = UIImageView()
        imageView.image = Constants.backgroundSecond
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var rezultText: UILabel = {
        let label = UILabel()
        label.text = "YOUR RESULT"
        label.font = .systemFont(ofSize: 40, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bmiLabel: UILabel = {
        let label = UILabel()
        label.text = bmiValue
        label.font = .systemFont(ofSize: 80, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = advice
        label.font = .systemFont(ofSize: 40, weight: .thin)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var recalculcateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ReCaculate", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.purple, for: .normal)
        button.addTarget(self, action: #selector (recalculateTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setupViews()
        setupLayout()
    }
    
    private func setupViews() {
        view.backgroundColor = color
        view.addSubviews(imageView, rezultText, bmiLabel, descriptionLabel, recalculcateButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            rezultText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            rezultText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            bmiLabel.topAnchor.constraint(equalTo: rezultText.bottomAnchor, constant: 30),
            bmiLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: bmiLabel.bottomAnchor, constant: 20),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            recalculcateButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            recalculcateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            recalculcateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            recalculcateButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc
    func recalculateTapped(_ sender: UIButton) {

        
        navigationController?.popViewController(animated: true)
    }
    
}

#Preview(traits: .portrait, body: {
    ResultViewController()
})

