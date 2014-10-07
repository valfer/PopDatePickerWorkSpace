//
//  DatePickerActionSheet.swift
//  iDoctors
//
//  Created by Valerio Ferrucci on 30/09/14.
//  Copyright (c) 2014 Tabasoft. All rights reserved.
//

import UIKit

protocol DataPickerViewControllerDelegate : class {
    
    func datePickerVCDismissed(date : NSDate?)
}

class PopDateViewController : UIViewController {
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    weak var delegate : DataPickerViewControllerDelegate?

    var currentDate : NSDate? {
        didSet {
            updatePickerCurrentDate()
        }
    }

    override convenience init() {

        /*
        this is necessary in order to build PopDatePicker as a separate framework
        */
        let frameworkBundleID = "it.tabasoft.PopDatePicker";
        let frameworkBundle = NSBundle(identifier: frameworkBundleID)
        self.init(nibName: "PopDateViewController", bundle: frameworkBundle)
    }

    private func updatePickerCurrentDate() {
        
        if let _currentDate = self.currentDate {
            if let _datePicker = self.datePicker {
                _datePicker.date = _currentDate
            }
        }
    }

    @IBAction func okAction(sender: AnyObject) {
        
        //dateChanged(self.datePicker)
        self.dismissViewControllerAnimated(true) {
            
            let nsdate = self.datePicker.date
            self.delegate?.datePickerVCDismissed(nsdate)
            
        }
    }
    
    override func viewDidLoad() {
        
        //datePicker.addTarget(self, action: "dateChanged:", forControlEvents: .ValueChanged)
        updatePickerCurrentDate()
    }
    
    override func viewDidDisappear(animated: Bool) {
        
        //if isBeingDismissed() {
        self.delegate?.datePickerVCDismissed(nil)
        //}
    }
    
    /*func dateChanged(sender : UIDatePicker) {
        delegate?.dateChoosen(datePicker.date)
    }*/
}
