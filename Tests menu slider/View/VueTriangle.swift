//
//  VueTriangle.swift
//  Tests menu slider
//
//  Created by Philippe MICHEL on 18/01/2024.
//

import SwiftUI

struct VueTriangle: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            Path { Path in
                Path.move(to: CGPoint(x: 200, y: 100))
                Path.addLine(to: CGPoint(x: 100, y: 300))
                Path.addLine(to: CGPoint(x: 300, y: 300))
                Path.addLine(to: CGPoint(x: 200, y: 100))
            }
            .fill(.brown)
            .shadow(radius: 10)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: Ressources.images.fermerFenetre.rawValue)
                    }
                }
            }
            
        }
    }
}

#Preview {
    VueTriangle()
}
