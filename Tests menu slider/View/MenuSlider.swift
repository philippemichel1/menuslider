//
//  MenuSlider.swift
//  Tests menu slider
//
//  Created by Philippe MICHEL on 16/01/2024.
//

import SwiftUI

struct MenuSlider: View {
    @Binding var montrerMenu:Bool
    @State var selectionBoutonMenu = "Triangle"
    @Namespace var animation
    
    
    var body: some View {
                VStack {
                    HStack {                        
                        ZStack {
                            Image(Ressources.images.logo.rawValue)
                                .resizable()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .padding(.horizontal, 24)
                        }
                    }
                    .padding(.top, 20)
                    
                    //GeometryReader {position in
                    Link("Titastus.com", destination: URL(string: Ressources.LienInternet.siteInternet.rawValue)!)
                    //Text("Titastus.com")"
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                        .padding(.top,10)
                        .padding(.bottom,40)
                        .frame(width: 320)
                        //.frame(width: position.size.width)
                    
                   // } // fin GeometryReader
       // Création bouton
                    VStack(alignment:.leading) {
                        MenuBoutons(image: Ressources.images.triangle.rawValue, titre: Ressources.Formes.triangle.rawValue, selectionBoutonMenu: $selectionBoutonMenu, montrerMenu: $montrerMenu, animation: animation)
                           
                        
                        MenuBoutons(image: Ressources.images.cercle.rawValue, titre: Ressources.Formes.cercle.rawValue, selectionBoutonMenu: $selectionBoutonMenu, montrerMenu: $montrerMenu, animation: animation)
                            
                        
                        MenuBoutons(image: Ressources.images.carre.rawValue, titre: Ressources.Formes.carre.rawValue, selectionBoutonMenu: $selectionBoutonMenu, montrerMenu: $montrerMenu, animation: animation)
                            
                        
                        MenuBoutons(image: Ressources.images.rectangle.rawValue, titre: Ressources.Formes.rectangle.rawValue, selectionBoutonMenu: $selectionBoutonMenu, montrerMenu: $montrerMenu, animation: animation)
                            
                        
                        MenuBoutons(image: Ressources.images.ovale.rawValue, titre: Ressources.Formes.ovale.rawValue, selectionBoutonMenu: $selectionBoutonMenu, montrerMenu: $montrerMenu, animation: animation)
                        
                        MenuBoutons(image: Ressources.images.capsule.rawValue, titre: Ressources.Formes.capsule.rawValue, selectionBoutonMenu: $selectionBoutonMenu, montrerMenu: $montrerMenu, animation: animation)
                        
//                        ForEach(0..<4) {index in
//                            MenuBoutons(image: Ressources.images.ovale.rawValue, titre: Ressources.Formes.ovale.rawValue, selectionBoutonMenu: $selectionBoutonMenu, montrerMenu: $montrerMenu, animation: animation)
//                        }
                        Spacer()
                    }
                    .padding(.leading, -160)
                    .padding(.top,5)
                }
        // emplacement vertical du logo
                .padding(.vertical, 30)
                // degradé de couleur de la slide
                .background(LinearGradient(colors: [Color(.brown),Color(.orange) ], startPoint: .top, endPoint: .bottom))
        // Largeur de la slide
                .padding(.trailing, 80)
                
        // Affiche ou cache la slide en fonction de la valeur de montre menu
                .offset(x: montrerMenu ? 0 : -UIScreen.main.bounds.width)
        
        // effet de rotation d'angle de la vue slide
                .rotation3DEffect(Angle(degrees: montrerMenu ? 0 : 45), axis: (x:0, y:20, z:0))
                
                .animation((.default),value: montrerMenu)
                .onTapGesture {
                        self.montrerMenu.toggle()
                    
                }
                
                .edgesIgnoringSafeArea(.vertical)
            }
        }

    #Preview {
    MenuSlider(montrerMenu: .constant(true))
}

