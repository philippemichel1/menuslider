//
//  VueTriangle.swift
//  Tests menu slider
//
//  Created by Philippe MICHEL on 18/01/2024.
//

import SwiftUI

struct VueTriangle: View {
    var body: some View {
      
        
            Path { Path in
                Path.move(to: CGPoint(x: 200, y: 100))
                Path.addLine(to: CGPoint(x: 100, y: 300))
                Path.addLine(to: CGPoint(x: 300, y: 300))
                Path.addLine(to: CGPoint(x: 200, y: 100))
            }
            
            .fill(.brown)
            .shadow(radius: 10)
           
        
        
    }
}

#Preview {
    VueTriangle()
}
