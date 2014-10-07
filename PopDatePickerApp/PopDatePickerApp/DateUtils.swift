//
//  DateUtils.swift
//  iDoctors
//
//  Created by Valerio Ferrucci on 02/10/14.
//  Copyright (c) 2014 Tabasoft. All rights reserved.
//

import Foundation

extension NSDate {
    
    // trasforma da GG/MM/AAAA -> Date System Formatted Medium
    func ToDateMediumString() -> NSString? {
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle;
        formatter.timeStyle = .NoStyle;
        return formatter.stringFromDate(self)
    }

    func ToDateGGMMYYYYString() -> NSString? {
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd/MM/yyyy";
        return formatter.stringFromDate(self)
    }
}

extension NSString {
    
    // trasforma da GG/MM/AAAA -> Date System Formatted Medium
    func ToDateMediumString() -> NSString? {
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd/MM/yyyy";
        let nsdate : NSDate? = formatter.dateFromString(self)
        
        var res : NSString?
        if let _nsdate = nsdate {
            
            formatter.dateStyle = .MediumStyle;
            formatter.timeStyle = .NoStyle;
            res = formatter.stringFromDate(_nsdate)
        }
        return res
    }
    
    // ... il contrario
    func ToDateGGMMYYYYString() -> NSString? {
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle;
        formatter.timeStyle = .NoStyle;
        let nsdate : NSDate? = formatter.dateFromString(self)
        
        var res : NSString?
        if let _nsdate = nsdate {
            
            formatter.dateFormat = "dd/MM/yyyy";
            res = formatter.stringFromDate(_nsdate)
        }
        return res
    }
}
