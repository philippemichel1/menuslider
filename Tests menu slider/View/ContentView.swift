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
                    Text("Appuyez sur le bouton en haut à droite, pour faire apparaitre ou disparaitre le menu slider")
                        .padding()
                        .foregroundColor(.accent)
                        .font(.system(size: 18))
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
                    }.onAppear {
                        
                        
                    }
            }
            
            
            
            
        }
        .edgesIgnoringSafeArea(.vertical)
        
        
        
        
    }
}

#Preview {
    ContentView()
}
