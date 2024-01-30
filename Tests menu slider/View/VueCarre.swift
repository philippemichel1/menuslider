//
//  VueCarre.swift
//  Tests menu slider
//
//  Created by Philippe MICHEL on 18/01/2024.
//

import SwiftUI

struct VueCarre: View {
    @Environment(\.dismiss) var dismiss
    @State var hauteur: CGFloat = 200
    @State var largeur: CGFloat = 200
    @State var coinsArrondis:CGFloat = 10
    @State var recouvrementForme:Double = 0
    var body: some View {
        NavigationStack() {
            ZStack(alignment:.leading) {
                Rectangle()
                    .fill(.gray).opacity(0.25)
                    .shadow(radius: coinsArrondis)
                    .frame(width: largeur, height: hauteur)
                    .navigationTitle(Ressources.Formes.carre.rawValue)
                Rectangle()
                    .fill(.brown)
                    .frame(width: largeur * recouvrementForme / 100, height: hauteur)
                    .animation(.linear, value: recouvrementForme)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button(action: {
                                dismiss()
                            }) {
                                Image(systemName: Ressources.images.fermerFenetre.rawValue)
                            }
                        }
                }
            }.onReceive(Timer.publish(every: 0.1, on: .main, in: RunLoop.Mode.common).autoconnect()) {_ in
                majAnimation()
                
            }
    
        }
    }
    func majAnimation() {
        if recouvrementForme <= 100 {
            recouvrementForme += 1
        } else {
            recouvrementForme  = 1
        }
    }
}

#Preview {
    VueCarre()
}
