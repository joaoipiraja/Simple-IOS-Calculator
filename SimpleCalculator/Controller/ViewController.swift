//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by João Victor Ipirajá de Alencar on 09/12/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelResultado: UILabel!
    var cb:calculatorBrain = calculatorBrain()
    
    
    func showWhatisInserted(){
        labelResultado.text = cb.get_inserted()
        labelResultado.textColor = cb.get_inserted_color()
    }
    
    @IBAction func clickOperation(_ sender: UIButton) {
        cb.set_operationType(ot: sender.currentTitle!)
        showWhatisInserted()
    }
    
    @IBAction func clickNumber(_ sender: UIButton) {
        cb.set_inserted_character(r: sender.currentTitle!)
        showWhatisInserted()
    }
    
    @IBAction func calculate(_ sender: Any) {
        cb.makeOperation()
        showWhatisInserted()
    }
    
    @IBAction func makePercentage(_ sender: Any) {
            cb.makePercentage()
            showWhatisInserted()
    }
    
    
    @IBAction func clickSign(_ sender: Any) {
            cb.put_sign()
            showWhatisInserted()
        
    }
    
    @IBAction func clickComma(_ sender: Any) {
            cb.put_Comma()
            showWhatisInserted()
    }
    @IBAction func clickAC(_ sender: Any) {
            cb.set_AC()
            showWhatisInserted()
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }


}

