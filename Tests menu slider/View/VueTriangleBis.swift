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
    @State var lancerAnimation:Bool = false
    var body: some View {
        
    
        NavigationStack {
            VStack {
                TriangleBis()
                    .fill(.brown)
                    .frame(width: 200, height: 200)
                    .rotationEffect(lancerAnimation ? Angle(degrees: 180) : Angle(degrees: 0))
                    .animation(.linear(duration: 2), value: lancerAnimation)
                    .navigationTitle("Triangle" )
                Button(action: {
                    self.lancerAnimation.toggle()
                }) {
                    Text("Lancer Animation")
                        .padding(.top, 30)
                }
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
}


#Preview {
    VueTriangleBis()
}
