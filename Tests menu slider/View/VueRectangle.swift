//
//  VueRectangle.swift
//  Tests menu slider
//
//  Created by Philippe MICHEL on 18/01/2024.
//

import SwiftUI

// vue de la vue rectangle
struct VueRectangle: View {
    @State var hauteur:CGFloat = 100
    @State var largeur:CGFloat = 200
    @State var verifOrientation: Bool
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            Rectangle()
                .fill(.brown)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .frame(width: largeur,height: hauteur)
                .animation(.linear, value: verifOrientation)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: Ressources.images.fermerFenetre.rawValue)
                        }
                    }
                }
                .navigationTitle(Ressources.Formes.rectangle.rawValue)
                .toolbarTitleDisplayMode(.automatic)
        }
        .onAppear {
            // début animation
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                lancementAnimation()
            }
            
            
        }.onReceive(Timer.publish(every: 2, on: .main, in: RunLoop.Mode.common).autoconnect()) {_ in
            // mise à jour l'angle
            majAnimation()
        }
    }
    func lancementAnimation() {
        
        verifOrientation = false
        hauteur = 100
        largeur = 200
        
    }

    func majAnimation() {
        if verifOrientation == false {
            largeur -= 100
            hauteur += 100
        } else {
            largeur += 100
            hauteur -= 100
        }
        verifOrientation.toggle()
    }
}




#Preview {
    VueRectangle( verifOrientation: false)
}
