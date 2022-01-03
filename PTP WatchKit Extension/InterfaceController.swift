//
//  InterfaceController.swift
//  PTP WatchKit Extension
//
//  Created by Matsui Keiji on 2016/01/28.
//  Copyright © 2016年 Matsui Keiji. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet weak var PretestPicker: WKInterfacePicker!
    @IBOutlet weak var SensitivityPicker: WKInterfacePicker!
    @IBOutlet weak var SpecificityPicker: WKInterfacePicker!
    @IBOutlet weak var PositiveResult: WKInterfaceLabel!
    @IBOutlet weak var NegativeResult: WKInterfaceLabel!
    var vPretestProbability = 1.0
    var vSensitivity = 1.0
    var vSpecificity = 1.0

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        var pickerItems: [WKPickerItem] = []
        for i in 0...100 {
            let item = WKPickerItem()
            item.title = "\(100-i)"
            pickerItems.append(item)
        }
        self.PretestPicker.setItems(pickerItems)
        self.SensitivityPicker.setItems(pickerItems)
        self.SpecificityPicker.setItems(pickerItems)
        // Configure interface objects here.
    }
    
    func myCalculation(){
        let vPositiveResult = 100.0*vSensitivity*vPretestProbability/(vSensitivity*vPretestProbability+(1.0-vSpecificity)*(1.0-vPretestProbability))
        let vNegativeResult = 100.0*(1.0-vSpecificity*(1.0-vPretestProbability)/(vSpecificity*(1.0-vPretestProbability)+(1.0-vSensitivity)*vPretestProbability))
        if vPositiveResult < 10.0{
            PositiveResult.setText("positive " + (NSString(format: "%0.2lf", vPositiveResult) as String) + "%")
        }
        else{
            PositiveResult.setText("positive " + (NSString(format: "%0.1lf", vPositiveResult) as String) + "%")
        }
        if vNegativeResult < 10.0{
            NegativeResult.setText("negative " + (NSString(format: "%0.2lf", vNegativeResult) as String) + "%")
        }
        else{
            NegativeResult.setText("negative " + (NSString(format: "%0.1lf", vNegativeResult) as String) + "%")
        }

    }
    
    @IBAction func PretestPickerChanged(value: Int){
        vPretestProbability = Double(100-value)/100.0
        self.myCalculation()
    }
    
    @IBAction func SensitivityPickerChanged(value: Int){
        vSensitivity = Double(100-value)/100.0
        self.myCalculation()
    }
    
    @IBAction func SpecificityPickerChanged(value: Int){
        vSpecificity = Double(100-value)/100.0
        self.myCalculation()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
