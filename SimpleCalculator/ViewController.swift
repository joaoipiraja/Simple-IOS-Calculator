//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by João Victor Ipirajá de Alencar on 09/12/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelResultado: UILabel!
    var HasDot:Bool = false
    var operationType:String = ""
    var result:Double = 0
    
    func showValue(value:Double){
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 12
        labelResultado.text! = numberFormatter.string(from: NSNumber(value: value))!
    }
    
    func isTyping() -> Bool{
        return !labelResultado.text!.isEmpty
    }
    
    func changeValue(value:String){
        
        if(labelResultado.text == "0"){
            labelResultado.text! =  value
        }else{
            labelResultado.text! +=  value
        }
    }
    
    
    @IBAction func calculateOperation(_ sender: Any) {
       
        if(isTyping()){
            switch operationType {
                case "/":
                    result = result / (labelResultado.text! as NSString).doubleValue
                   
                case "*":
                result = result * (labelResultado.text! as NSString).doubleValue
                  
                case "-":
                result = result - (labelResultado.text! as NSString).doubleValue
                case "+":
                result = result + (labelResultado.text! as NSString).doubleValue
                
                default:
                        break
            }
            
            operationType = ""
            showValue(value: result)
        }
       
        
        
    }
    
    
    @IBAction func makeAddition(_ sender: Any) {
        if(isTyping()){
        result = (labelResultado.text! as NSString).doubleValue
        operationType = "+"
        labelResultado.text! = ""
        }
    }
    @IBAction func makeSubtraction(_ sender: Any) {
        if(isTyping()){
        result = (labelResultado.text! as NSString).doubleValue
        operationType = "-"
        labelResultado.text! = ""
        }
    }
    
    @IBAction func makeMultiplication(_ sender: Any) {
        if(isTyping()){
        result = (labelResultado.text! as NSString).doubleValue
        operationType = "*"
        labelResultado.text! = ""
        }
    }
    @IBAction func makeDivision(_ sender: Any) {
        if(isTyping()){
        result = (labelResultado.text! as NSString).doubleValue
        operationType = "/"
        labelResultado.text! = ""
        }
    }
    
    
    @IBAction func makePercentage(_ sender: Any) {
        if(isTyping()){
            let k = ((labelResultado.text! as NSString).doubleValue)/100
  
                showValue(value: k)
            
        }
    }
    
    
    @IBAction func clickSign(_ sender: Any) {
        if(isTyping() && labelResultado.text!.contains("-")){
            labelResultado.text = labelResultado.text!.replacingOccurrences(of: "-", with: "")
        }else if(isTyping()){
            labelResultado.text = "-"+labelResultado.text!
        }
    
    }
    
    @IBAction func clickDot(_ sender: Any) {
        if(!HasDot && isTyping()){
            changeValue(value: ".")
            HasDot = true
        }
        
    }
    @IBAction func clickAC(_ sender: Any) {
        labelResultado.text = ""
        HasDot = false
        operationType = ""
        result = 0
    }
    
    @IBAction func clickZero(_ sender: Any) {
        changeValue(value: "0")
    }
    @IBAction func clickThree(_ sender: Any) {
        changeValue(value: "3")
    }
    @IBAction func clickTwo(_ sender: Any) {
        changeValue(value: "2")
    }
    @IBAction func clickOne(_ sender: Any) {
        changeValue(value: "1")
    }
    @IBAction func clickSIx(_ sender: Any) {
        changeValue(value: "6")
    }
    @IBAction func clickFive(_ sender: Any) {
        changeValue(value: "5")
    }
    @IBAction func clickFour(_ sender: Any) {
        changeValue(value: "4")
    }
    @IBAction func clickNine(_ sender: Any) {
        changeValue(value: "9")
    }
    @IBAction func clickEight(_ sender: Any) {
        changeValue(value: "8")
    }
    @IBAction func clickSeven(_ sender: Any) {
        changeValue(value: "7")
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }


}

