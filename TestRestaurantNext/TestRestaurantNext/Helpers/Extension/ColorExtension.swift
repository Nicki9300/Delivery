//
//  ImageExtension.swift
//  TestRestaurantNext
//
//  Created by Коля Мамчур on 26.03.2021.
//


import UIKit

extension UIColor {
    
    enum AssetsColor: String {
   
        case green
        case orange
        case red
    }
    
    static func appColor(_ name: AssetsColor) -> UIColor {
        
        guard let color = UIColor(named: name.rawValue) else {
            print("Error: color \(name.rawValue) not found")
            return .red
        }
        
        return color
    }
}
