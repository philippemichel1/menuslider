//
//  ContentView.swift
//  Tests menu slider
//
//  Created by Philippe MICHEL on 16/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State var montrerMenuSlider:Bool = false
    var body: some View {
        
        NavigationStack {
            
            GeometryReader { geo in
                //VueTriangle()
                MenuSlider(montrerMenu: $montrerMenuSlider)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {self.montrerMenuSlider.toggle() } label: {
                                Image(systemName: Ressources.image.menu.rawValue)
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
