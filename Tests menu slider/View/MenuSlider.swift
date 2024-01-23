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
                            Image(Ressources.image.logo.rawValue)
                                .resizable()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .padding(.horizontal, 24)
                        }
                    }
                    .padding(.top, 20)
                    Text("Titastus.com")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                        .padding(.top,10)
                        .padding(.bottom,40)
                        
                   
                    
                    Button(action: {
                      
                        montrerMenu = false}
                           , label: { MenuPropriete(rowActive: false, icon:""
                            ,text: "" )
                    })
                    
       // Création bouton 
                    
                        
                        MenuBoutons(image: Ressources.image.triangle.rawValue, titre: "Triangle", selectionBoutonMenu: $selectionBoutonMenu, montrerMenu: $montrerMenu, animation: animation)
                            .padding(.leading, -160)
                            .padding(.top,5)
                        
                        
                        MenuBoutons(image: Ressources.image.cercle.rawValue, titre: "Cercle", selectionBoutonMenu: $selectionBoutonMenu, montrerMenu: $montrerMenu, animation: animation)
                            .padding(.leading, -160)
                            .padding(.top,5)
                        
                        MenuBoutons(image: Ressources.image.carre.rawValue, titre: "Carré", selectionBoutonMenu: $selectionBoutonMenu, montrerMenu: $montrerMenu, animation: animation)
                            .padding(.leading, -160)
                            .padding(.top,5)
                        
                        MenuBoutons(image: Ressources.image.rectangle.rawValue, titre: "Retangle", selectionBoutonMenu: $selectionBoutonMenu, montrerMenu: $montrerMenu, animation: animation)
                            .padding(.leading, -160)
                            .padding(.top,5)
                        
                        MenuBoutons(image: Ressources.image.ovale.rawValue, titre: "Ovale", selectionBoutonMenu: $selectionBoutonMenu, montrerMenu: $montrerMenu, animation: animation)
                            .padding(.leading, -160)
                            .padding(.top,5)
                    
                    
                    
                    Spacer()
                    
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

