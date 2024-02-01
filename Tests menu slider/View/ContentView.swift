//
//  ContentView.swift
//  Tests menu slider
//
//  Created by Philippe MICHEL on 16/01/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.dismiss) var dismiss
    @State var montrerMenuSlider:Bool = true
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                VStack {
                    Spacer()
                    Text("Appuyez sur le bouton en haut à droite, pour faire apparaitre ou disparaitre le menu ")
                        .padding()
                        .foregroundColor(.accent)
                        .font(.system(size: 18))
                    Spacer()
                }
                MenuSlider(montrerMenu: $montrerMenuSlider)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                dismiss()
                                self.montrerMenuSlider.toggle() } label: {
                                Image(systemName: Ressources.images.menu.rawValue)
                                    .resizable()
                                    .imageScale(.large)
                                Spacer()
                            }
                        }
                    }
            }
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

#Preview {
    ContentView()
}
