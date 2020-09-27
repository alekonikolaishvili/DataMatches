//
//  ConvertToTime.swift
//  dotaMatches
//
//  Created by Aleksy Nikolaishvili on 9/26/20.
//

import Foundation

struct ConvertToTime {
    func time (interval : Int) -> String {
        let s = interval % 60
        let m = (interval / 60) % 60
        let h = (interval / (60 * 60)) % 24
        
        return String(format: " %0.2d:%0.2d:%0.2d",h,m,s)
    }
}
