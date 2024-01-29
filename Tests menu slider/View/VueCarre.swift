//
//  VueCarre.swift
//  Tests menu slider
//
//  Created by Philippe MICHEL on 18/01/2024.
//

import SwiftUI

struct VueCarre: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            Rectangle()
                .fill(.brown)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .frame(width: 200, height: 200)
                .navigationTitle(Ressources.Formes.carre.rawValue)
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
    VueCarre()
}
