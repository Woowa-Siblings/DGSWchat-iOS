//
//  StringExt.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import Foundation

extension String {
    func isValidGrade() -> Bool {
        let gradeRegEx = "[1-3]{1}"
        
        let gradeTest = NSPredicate(format:"SELF MATCHES %@", gradeRegEx)
        return gradeTest.evaluate(with: self)
    }
    
    func isValidClass() -> Bool {
        let classRegEx = "[1-3]{1}"
        
        let classTest = NSPredicate(format:"SELF MATCHES %@", classRegEx)
        return classTest.evaluate(with: self)
    }
    
    func isInt() -> Bool {
        return Int(self) != nil
    }
    
    func isValidNumber() -> Bool {
        return self.isInt() && !self.isEmpty && self.count < 3
    }
}
