//
//  ViewController.swift
//  PTP
//
//  Created by Matsui Keiji on 2016/01/28.
//  Copyright © 2016年 Matsui Keiji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var RUNButton: UIButton!
    @IBOutlet weak var decimalButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var NegativeLikelifoodRatio: UILabel!
    @IBOutlet weak var NegativeResult: UILabel!
    @IBOutlet weak var PositiveLikelifoodRatio: UILabel!
    @IBOutlet weak var PositiveResult: UILabel!
    @IBOutlet weak var PretestProbability: UITextField!
    @IBOutlet weak var Sensitivity: UITextField!
    @IBOutlet weak var Specificity: UITextField!

    override func viewDidLoad() {
        PretestProbability.becomeFirstResponder()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func myAlertAction(){
        let myAlert: UIAlertController = UIAlertController(title: "Too large", message: "The value is from 0 to 100.", preferredStyle: .Alert)
        let myOkAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        myAlert.addAction(myOkAction)
        presentViewController(myAlert, animated: true, completion: nil)
    }
    
    func clearAll(){
        PositiveResult.text = ""
        NegativeResult.text = ""
        PositiveLikelifoodRatio.text = ""
        NegativeLikelifoodRatio.text = ""
    }
    
    @IBAction func myActionRUN(){
        self.view.endEditing(true)
        var vPretestProbability = 0.0
        if Double(PretestProbability.text!) != nil{
            vPretestProbability = Double(PretestProbability.text!)!/100.0
        }
        var vSensitivity = 0.0
        if Double(Sensitivity.text!) != nil{
            vSensitivity = Double(Sensitivity.text!)!/100.0
        }
        var vSpecificity = 0.0
        if Double(Specificity.text!) != nil{
            vSpecificity = Double(Specificity.text!)!/100.0
        }
        if vPretestProbability > 1.0 || vSensitivity > 1.0 || vSpecificity > 1.0{
            self.myAlertAction()
            self.clearAll()
        }
        else{
        let vPositiveResult = 100.0*vSensitivity*vPretestProbability/(vSensitivity*vPretestProbability+(1.0-vSpecificity)*(1.0-vPretestProbability))
        let vNegativeResult = 100.0*(1.0-vSpecificity*(1.0-vPretestProbability)/(vSpecificity*(1.0-vPretestProbability)+(1.0-vSensitivity)*vPretestProbability))
        let vPositiveLikelifoodRatio = vSensitivity/(1.0-vSpecificity)
        let vNegativeLikelifoodRatio = (1.0-vSensitivity)/vSpecificity
        if vPositiveResult < 10.0{
            PositiveResult.text = NSString(format: "%0.2lf", vPositiveResult) as String
        }
        else{
            PositiveResult.text = NSString(format: "%0.1lf", vPositiveResult) as String
        }
        if vNegativeResult < 10.0{
            NegativeResult.text = NSString(format: "%0.2lf", vNegativeResult) as String
        }
        else{
            NegativeResult.text = NSString(format: "%0.1lf", vNegativeResult) as String
        }
        if vPositiveLikelifoodRatio < 10.0{
            PositiveLikelifoodRatio.text = NSString(format: "%0.2lf", vPositiveLikelifoodRatio) as String
        }
        else{
            PositiveLikelifoodRatio.text = NSString(format: "%0.1lf", vPositiveLikelifoodRatio) as String
        }
        NegativeLikelifoodRatio.text = NSString(format: "%0.1lf", vNegativeLikelifoodRatio) as String
        }//else
    }//@IBAction func myActionRUN
    
    @IBAction func myActionDecimal(){
        if PretestProbability.editing{
            if Double(PretestProbability.text!) == nil{
                PretestProbability.text = "0."
            }
            if PretestProbability.text!.rangeOfString(".") == nil{
                PretestProbability.text = PretestProbability.text! + "."
            }
        }//if PretestProbability.editing
        if Sensitivity.editing{
            if Double(Sensitivity.text!) == nil{
                Sensitivity.text = "0."
            }
            if Sensitivity.text!.rangeOfString(".") == nil{
                Sensitivity.text = Sensitivity.text! + "."
            }
        }//if Sensitivity.editing
        if Specificity.editing{
            if Double(Specificity.text!) == nil{
                Specificity.text = "0."
            }
            if Specificity.text!.rangeOfString(".") == nil{
                Specificity.text = Specificity.text! + "."
            }
        }
    }//@IBAction func myActionDecimal
    
    @IBAction func myActionclear(){
        PretestProbability.text = ""
        Sensitivity.text = ""
        Specificity.text = ""
        PositiveResult.text = ""
        NegativeResult.text = ""
        PositiveLikelifoodRatio.text = ""
        NegativeLikelifoodRatio.text = ""
        PretestProbability.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

