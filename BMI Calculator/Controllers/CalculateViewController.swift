//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    
    let calculatorBrain = CalculatorBrain()
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.backgroundFirst
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Calculate
        Your BMI
        """
        label.font = .systemFont(ofSize: 50 ,weight: .semibold)
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var heightLabel: UILabel = {
        let label = UILabel()
        label.text = "Height"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var currentHeightLabel: UILabel = {
        let label = UILabel()
        label.text = "\(heightSlider.value)"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var currentWeightLabel: UILabel = {
        let label = UILabel()
        label.text = "\(weightSlider.value)"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    private lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.text = "Weight"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var heightSlider: UISlider = {
        let slider = UISlider()
        slider.tintColor = .systemPurple
        slider.minimumValue = 0.5
        slider.maximumValue = 2.5
        slider.setValue(1.5, animated: true)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(setupHeightLabel(sender:)), for: .valueChanged)
        return slider
    }()
    
    private lazy var weightSlider: UISlider = {
        let slider = UISlider()
        slider.tintColor = .systemPurple
        slider.minimumValue = 0
        slider.maximumValue = 150
        slider.setValue(50, animated: true)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(setupWeightLabel(sender:)), for: .valueChanged)
        return slider
    }()
    
    private lazy var calculcateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Caculate", for: .normal)
        button.backgroundColor = .systemPurple
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector (calculateTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
    }
    
    private func setupViews(){
        view.addSubviews(
            backgroundImageView,
            textLabel,
            heightSlider,
            weightSlider,
            heightLabel,
            weightLabel,
            currentHeightLabel,
            currentWeightLabel,
            calculcateButton
        )
    }
    
    private func setupLayout(){
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            heightLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 280),
            heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            currentHeightLabel.topAnchor.constraint(equalTo: heightLabel.topAnchor),
            currentHeightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            heightSlider.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 10),
            heightSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            heightSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            weightLabel.topAnchor.constraint(equalTo: heightSlider.bottomAnchor, constant: 10),
            weightLabel.leadingAnchor.constraint(equalTo: heightSlider.leadingAnchor),
            
            currentWeightLabel.topAnchor.constraint(equalTo: weightLabel.topAnchor),
            currentWeightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            
            weightSlider.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 10),
            weightSlider.leadingAnchor.constraint(equalTo: heightSlider.leadingAnchor),
            weightSlider.trailingAnchor.constraint(equalTo: heightSlider.trailingAnchor),
            
            
            calculcateButton.topAnchor.constraint(equalTo: weightSlider.bottomAnchor, constant: 10),
            calculcateButton.leadingAnchor.constraint(equalTo: weightLabel.leadingAnchor),
            calculcateButton.trailingAnchor.constraint(equalTo: weightSlider.trailingAnchor),
            calculcateButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    @objc func calculateTapped (_ sender: UIButton) {
        
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        let nextVC = ResultViewController()
        nextVC.bmiValue = calculatorBrain.getBMIValue()
        nextVC.advice = calculatorBrain.getAdvice()
        nextVC.color = calculatorBrain.getColor()
        
        navigationController?.pushViewController(nextVC, animated: true)
    }

        
    
    @objc private func setupWeightLabel(sender: UILabel!){
        DispatchQueue.main.async{
            let weight = self.weightSlider.value
            self.currentWeightLabel.text = String(format: "%.1f", weight)
        }
    }
    
    @objc private func setupHeightLabel(sender: UILabel!){
        DispatchQueue.main.async{
            let height = self.heightSlider.value
            self.currentHeightLabel.text = String(format: "%.2f", height)
        }
    }
    
//    @IBAction func heightSliderChanged(_ sender: UISlider) {
//        let height = String(format: "%.2f", sender.value)
//        heightLabel.text = "\(height)m"
//    }
//    
//    @IBAction func weightSliderChanged(_ sender: UISlider) {
//        let weight = String(format: "%.0f", sender.value)
//        weightLabel.text = "\(weight)Kg"
//    }
//    
//    @IBAction func calculatePressed(_ sender: UIButton) {
//        let height = heightSlider.value
//        let weight = weightSlider.value
//
//        calculatorBrain.calculateBMI(height: height, weight: weight)
//        performSegue(withIdentifier: "goToResult", sender: self)
//        
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "goToResult" {
//            let destinationVC = segue.destination as! ResultViewController
//            destinationVC.bmiValue = calculatorBrain.getBMIValue()
//            destinationVC.advice = calculatorBrain.getAdvice()
//            destinationVC.color = calculatorBrain.getColor()
//        }
//    }
}

#Preview(traits: .portrait, body: {
    UINavigationController(rootViewController: CalculateViewController())
})
