//
//  VueCapsule.swift
//  Menu Slider
//
//  Created by Philippe MICHEL on 28/01/2024.
//

import SwiftUI

// creation d'une seule capsule
struct MaCpasule: View {
    @Binding var largeur:CGFloat
    @Binding var hauteur:CGFloat
    @Binding var color:Color
    
    var body: some View {
        Capsule()
            .frame(width: largeur, height: hauteur, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(color)
        
    }
}
//création de toutes les capsule et de l'animation 
struct AnimCapsule: View {
    @State private var hauteurAnimation = 400
    let nbrCapsule = 6
    @State private var hauteurCapsule:[CGFloat] = [0,0,0,0,0,0,0]
    @State private var capsuleLargeur:CGFloat = 30
    @State private var couleurCapsule:[Color] = [.brown,.pink,.brown,.pink,.brown,.pink,.brown]
    @State private var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        HStack(spacing:0){
            ForEach((0...nbrCapsule).reversed(), id: \.self) {capsule in
                MaCpasule(largeur: $capsuleLargeur, hauteur: $hauteurCapsule[capsule], color: $couleurCapsule[capsule])
                    .animation(.linear(duration: 0.6),value: hauteurCapsule[capsule])
                    .onReceive(timer) { time in
                        hauteurCapsule[capsule] = hauteurAleatoire()
                    }
            }
        }
        
    }
    // retourne une valeur aléatoire qui va definir la haiuteur de la capsule
    func hauteurAleatoire() -> CGFloat {
        return CGFloat(arc4random_uniform(UInt32(hauteurAnimation)))
    }
}
// vue de la capsule
struct VueCapsule: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            AnimCapsule()
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: Ressources.images.fermerFenetre.rawValue)
                        }
                    }
                }
                .navigationTitle(Ressources.Formes.capsule.rawValue)
                .toolbarTitleDisplayMode(.automatic)
        }
        
    }
}

#Preview {
    VueCapsule()
}
