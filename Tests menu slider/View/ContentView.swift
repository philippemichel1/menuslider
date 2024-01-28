//
//  ContentView.swift
//  Tests menu slider
//
//  Created by Philippe MICHEL on 16/01/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.dismiss) var dismiss
    @State var montrerMenuSlider:Bool = false
    var body: some View {
        
        NavigationStack {
            
            GeometryReader { geo in
               
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
