//
//  CalculatorBrain.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Iliyas Shakhabdin on 18.12.2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func calculate(height: Float, weight: Float){
        let bmiValue = weight / pow(height, 2)
        
        if bmiValue<18.5{
            bmi = BMI(value: bmiValue, advice: "Eat more cookies", color: #colorLiteral(red: 0, green: 0, blue: 1, alpha: 1))
        } else if bmiValue<24.9{
            bmi = BMI(value: bmiValue, advice: "Fir as a fiddle", color: #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice: "eat less cookies", color: #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1))
        }
        
    }
    
    func getAdvice()->String{
        return bmi?.advice ?? "there is an error"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
    
    func getBMIValue() -> String {
        let bmiValue = String(format: "%.1f", bmi?.value ?? 0.0) // or check by if statements
        return bmiValue
    }
}
