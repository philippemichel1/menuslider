//
//  VueCecle.swift
//  Tests menu slider
//
//  Created by Philippe MICHEL on 18/01/2024.
//

//Vue du cercle
import SwiftUI

struct VueCecle: View {
    @Environment(\.dismiss) var dismiss
    
    @State var lancerAnimation:Bool = false
    @State var position = CGPoint(x: 0, y: 0)
    let  formeGrosseur:CGFloat = 200
    let centreX = UIScreen.main.bounds.width / 2
    let largeurEcran = UIScreen.main.bounds.width
    let hauteurEcran = UIScreen.main.bounds.height
    
    
    var body: some View {
        NavigationStack {
            Circle()
                .fill(.brown)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .frame(width: formeGrosseur,height: formeGrosseur)
                .position(position)
                .animation(.linear, value: position)
            
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: Ressources.images.fermerFenetre.rawValue)
                        }
                    }
                }
                .navigationTitle(Ressources.Formes.cercle.rawValue)
                .toolbarTitleDisplayMode(.automatic)
            
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                position = CGPoint(x: centreX, y: 0)
                
            }
            
        }
        .onReceive(Timer.publish(every: 2, on: .main, in: RunLoop.Mode.common).autoconnect()) {_ in
            // mise à jour position
            majAnimation()
        }
    }
    
    // parametres de la position du cercle 
    func majAnimation() {
        var nouvellePosition = CGPoint(x: centreX, y: (hauteurEcran - formeGrosseur) - 50)
        
        if position.y == nouvellePosition.y {
            nouvellePosition = CGPoint(x: centreX, y: 0)
        }
        position = nouvellePosition
    }
}

#Preview {
    VueCecle()
}
