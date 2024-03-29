//
//  VueOvale.swift
//  Tests menu slider
//
//  Created by Philippe MICHEL on 18/01/2024.
//

import SwiftUI

// vue ovale
struct VueOvale: View {
    @Environment(\.dismiss) var dismiss
    
    @State var scale:Float = 1.0
    @State var hauteur:CGFloat = 100
    @State var largeur:CGFloat = 200
    
    var body: some View {
        NavigationStack {
            Ellipse()
                .fill(.brown)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .frame(width: largeur * CGFloat(scale) ,height: hauteur * CGFloat(scale))
                .transition(.scale)
                .animation(.linear, value: scale)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: Ressources.images.fermerFenetre.rawValue)
                        }
                    }
                }
                .navigationTitle(Ressources.Formes.ovale.rawValue)
                .toolbarTitleDisplayMode(.automatic)
            
        }
        .onReceive(Timer.publish(every: 2, on: .main, in: RunLoop.Mode.common).autoconnect()) {_ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                majAnimation()
            }
        }
        
    }
    func majAnimation() {
        if scale == 1 {
            scale = 2
        } else {
            scale = 1
        }
        
    }
}

#Preview {
    VueOvale()
}
