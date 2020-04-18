//
//  ShowDetailViewController.swift
//  RadioApp
//
//  Created by Carrel on 4/18/20.
//  Copyright © 2020 Carrel. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    

    @IBOutlet weak var showNameField: UITextField!
    
    @IBOutlet weak var showStartTime: UIDatePicker!
    
    @IBOutlet weak var showEndTime: UIDatePicker!
    
    @IBOutlet weak var dayPicker: UIPickerView!
    
    var pickerData: [String] = [String]()
    
    @IBOutlet weak var showDescriptionField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dayPicker.delegate = self
        self.dayPicker.dataSource = self
        
        pickerData = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
