//
//  VueCecle.swift
//  Tests menu slider
//
//  Created by Philippe MICHEL on 18/01/2024.
//

import SwiftUI

struct VueCecle: View {
    @Environment(\.dismiss) var dismiss
    
    @State var lancerAnimation:Bool = false
    @State var positionDepart = CGPoint(x: UIScreen.main.bounds.width / 2, y: 0)
    @State var positionArrive = CGPoint(x: UIScreen.main.bounds.width / 2, y: 550)
    let  formeGrosseur:CGFloat = 200
    
    
    var body: some View {
        NavigationStack {
            Circle()
                .fill(.brown)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .frame(width: formeGrosseur,height: formeGrosseur)
                .position(lancerAnimation ? positionArrive :positionDepart)
                //.offset(y: lancerAnimation ? 0 : -UIScreen.main.bounds.height)
                .animation(.linear(duration: 1), value: lancerAnimation )
                .navigationTitle(Ressources.Formes.cercle.rawValue)
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

#Preview {
    VueCecle()
}
