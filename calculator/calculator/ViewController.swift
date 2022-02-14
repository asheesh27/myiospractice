//
//  ViewController.swift
//  calculator
//
//  Created by macbook on 10/02/22.


import UIKit

class ViewController: UIViewController {
    var label: UITextField?
    var labelNumber : Double = 0
    var firstContainer: Double = 0
    var secondContainer: Double = 0
    var currentOperator: String?
    var symbol: Bool = false
    var afterDeciman: Bool = false
    var count:Int = 0
    
    @IBOutlet weak var allClearClear: UIButton!
    @IBOutlet weak var bigbutton: UIButton!
    @IBOutlet var allbuttons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label = UITextField(frame: CGRect(x: 0, y: 0, width:420, height: 100))
        label?.backgroundColor = .black
        label?.center = CGPoint(x: 200, y: 290)
        label?.textAlignment = .right
        label?.font = label?.font!.withSize(80)
        label?.text = String(round(labelNumber*1)/1)
        label?.textColor = .white
        guard let _label = label else {
            return
        }
        self.view.addSubview(_label)
        firstContainer = labelNumber
        secondContainer = firstContainer
        
        allClearClear.layer.cornerRadius = allClearClear.frame.width / 2
        allClearClear.layer.masksToBounds = true
        
        for button in allbuttons{
            button.layer.cornerRadius = button.frame.width / 2
            button.layer.masksToBounds = true
        }
        
        bigbutton.layer.cornerRadius = 40
        bigbutton.layer.masksToBounds = true
            
    }
   
    //--------------------------------------------------------------------- Numbers section
    func getOperands(){
        
    }
   
    @IBAction func buttonClick(_ sender:UIButton){
        if !symbol{
            switch sender.tag{
                case 1,2,3,4,5,6,7,8,9,0:
                    labelNumber = labelNumber*10 + Double(sender.tag)
                    label?.text = String(labelNumber)
                    firstContainer = labelNumber
                    secondContainer = firstContainer
                default:
                label?.text = "The outletcollection is working"
            }
        }else{
            switch sender.tag{
                case 1,2,3,4,5,6,7,8,9,0:
                    labelNumber = labelNumber*10 + Double(sender.tag)
                    label?.text = String(labelNumber)
                    secondContainer = labelNumber
                default:
                label?.text = "The outletcollection is working"
            }
        }
    }
    //--------------------------------------------------------------------- Modifiers section
    
    @IBAction func ac(_ sender: Any) {
        labelNumber = 0
        label?.text = String(labelNumber)
        count = 0
    }

    @IBAction func button(_ sender: Any) {
        labelNumber *= -1
        label?.text = String(labelNumber)
        
    }
    
    @IBAction func percentage(_ sender: Any) {
        labelNumber = labelNumber / 100
        label?.text = String(labelNumber)
    }

    
    @IBAction func checkResult(_ sender: Any) {
        if currentOperator == "+"{
            labelNumber = firstContainer+secondContainer
            label?.text = String(labelNumber)
        }else if currentOperator == "-"{
            labelNumber = firstContainer-secondContainer
            label?.text = String(labelNumber)
        }else if currentOperator == "*"{
            labelNumber = firstContainer*secondContainer
            label?.text = String(labelNumber)
        }else{
            labelNumber = firstContainer/secondContainer
            label?.text = String(labelNumber)
        }
        count = 0
    }
    
    @IBAction func pointer(_ sender: Any) {
        let labelNumber1 = Float(labelNumber)
        label?.text = String(labelNumber1)
    }
//-------------------------------------------------------------------------------Operators section
    @IBAction func operators(_ sender: Any) {
        guard let tag = ( sender as?  UIButton)?.tag else{
            return
        }
        if tag == 10{
            currentOperator = "/"
        }else if tag == 11{
            currentOperator = "*"
        }else if tag == 12{
            currentOperator = "-"
        }else if tag == 13{
            currentOperator = "+"
        }
        firstContainer = labelNumber
        labelNumber = 0
        label?.text = "0"
        symbol = true
        count += 1
    }
    
}





