//
//  FormeSelectionCustom.swift
//  Tests menu slider
//
//  Created by Philippe MICHEL on 25/01/2024.
//

import Foundation
import SwiftUI

struct FormeSelectionCustom:Shape {
    var coins: UIRectCorner
    var arrondis: CGFloat
    
    // création des arrondis pour le menu selection 
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: coins,  cornerRadii: CGSize(width: arrondis, height: arrondis))
        return Path(path.cgPath)
    }
    
}
