//
//  VueTriangleBis.swift
//  Tests menu slider
//
//  Created by Philippe MICHEL on 24/01/2024.
//

import SwiftUI

struct TriangleBis:Shape {
    func path(in rect : CGRect) -> Path {
        Path {path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

struct VueTriangleBis: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var angleRotation = 0
    var body: some View {
        
        NavigationStack {
            VStack {
                TriangleBis()
                    .fill(.brown)
                    .frame(width: 200, height: 200)
                    .rotationEffect(Angle(degrees: Double(angleRotation)))
                    .navigationTitle(Ressources.Formes.triangle.rawValue)
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
        .onAppear {
            // début animation
            lancementAnimation()
            
        }.onReceive(Timer.publish(every: 0.01, on: .main, in: RunLoop.Mode.common).autoconnect()) {_ in
            // mise à jour l'angle
            majAngle()
        }
    }
    
    func lancementAnimation() {
        angleRotation = 0
    }
    
    func majAngle() {
        angleRotation = angleRotation + 1
    }
}


#Preview {
    VueTriangleBis()
}
