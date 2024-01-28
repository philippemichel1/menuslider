//
//  VueOvale.swift
//  Tests menu slider
//
//  Created by Philippe MICHEL on 18/01/2024.
//

import SwiftUI

struct VueOvale: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            Ellipse()
                .fill(.brown)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .frame(width: 200,height: 100)
                .navigationTitle("Ovale")
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
    VueOvale()
}
