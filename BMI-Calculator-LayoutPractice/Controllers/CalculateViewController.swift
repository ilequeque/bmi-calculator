//
//  ViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calulatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UISlider!
    @IBOutlet weak var weightLabel: UISlider!
    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var weightValue: UILabel!

    @IBAction func hightSliderChanged(_ sender: UISlider) {
        heightValue.text = String(format: "%.2f", sender.value)+"m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightValue.text = String(format: "%.0f", sender.value)+"Kg"
    }
    
    @IBAction func calculateBMI(_ sender: UIButton) {
        let height = heightLabel.value
        let weight = weightLabel.value
        
        calulatorBrain.calculate(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calulatorBrain.getBMIValue()
            destinationVC.advice = calulatorBrain.getAdvice()
            destinationVC.color = calulatorBrain.getColor()
        }
    }
}

