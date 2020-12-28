//
//  calculatorBrain.swift
//  SimpleCalculator
//
//  Created by João Victor Ipirajá de Alencar on 28/12/20.
//

import Foundation
import UIKit

class calculatorBrain{
    
    private var HasComma:Bool = false
    private var operationType:String = ""
    private var result:Double = 0.0
    private var inserted:String = "0"
    private var isTyping:Bool = false
    
    private func numberFormatter() -> NumberFormatter{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 10
        numberFormatter.locale = NSLocale(localeIdentifier: "pt_BR") as Locale
        return numberFormatter
    }
    
    private func DoubleToString(num:Double) -> String{
        let nb = numberFormatter()
        return nb.string(from: NSNumber(value: num))!
    }
    
    private func StringToDouble(num:String) -> Double{
        let nb = numberFormatter()
        return Double(truncating: nb.number(from: num)!)
    }
    
    
    //Polymorphism
    
    func get_inserted()->String{
        return self.inserted
    }
    
    func get_inserted()->Double{
        return StringToDouble(num: self.inserted)
    }
    
    
    
    func get_inserted_color() -> UIColor{
        if(self.inserted.contains("-")){
            return #colorLiteral(red: 1, green: 0.2705882353, blue: 0.2274509804, alpha: 0.87)
        }else{
            return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    
    func set_inserted_character(r:String){
        
        self.isTyping = true
        
        if(self.inserted == "0"){
            self.inserted = r
        }else{
            self.inserted += r
        }
        
    }
    
    
    //Polymorphism
    
    func set_inserted(d:Double){
        self.inserted = self.DoubleToString(num: d)
    }
    
    func set_inserted(d:String){
        self.inserted = d
    }
    
    
    
    func set_AC(){
        self.inserted = "0"
        self.HasComma = false
        self.isTyping = false
        self.operationType = ""
        self.result = 0
    }
    
    func set_operationType(ot:String){
        
        if(self.isTyping){
            self.result = self.get_inserted()
            self.operationType = ot
            self.HasComma = false
            self.inserted = ""
        }
        
    }
    
    func put_Comma(){
        
        if(!self.HasComma){
            self.set_inserted_character(r: ",")
            HasComma = true
        }
        
    }
    
    func put_sign(){
        
        if(self.isTyping && self.inserted.contains("-")){
            self.inserted = self.inserted.replacingOccurrences(of: "-", with: "")
        }else if(self.isTyping){
            self.inserted = "-"+self.inserted
        }

    }
    
 
    func makeOperation(){
        
        switch self.operationType{
            case "÷":
                self.result /=  self.get_inserted()
            case "x":
                self.result *=  self.get_inserted()
            case "-":
                self.result -=  self.get_inserted()
            case "+":
                self.result += self.get_inserted()
            default:
                    break
        }
        
        self.operationType = ""
        self.set_inserted(d: result)
        self.result = get_inserted()
        
    }
    
    func makePercentage(){
        if(self.isTyping){
            let p = self.get_inserted()/100
            self.set_inserted(d: p)
        }
    }
    

}
