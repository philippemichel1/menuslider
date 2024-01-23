//
//  MenuBoutons.swift
//  Tests menu slider
//
//  Created by Philippe MICHEL on 22/01/2024.
//

import SwiftUI

struct MenuBoutons: View {
    var image:String
    var titre:String
    
    @Binding  var selectionBoutonMenu:String
    @Binding  var montrerMenu:Bool
    
    // Pour animation du menu slide
    var animation: Namespace.ID
    
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                withAnimation(.spring()) {selectionBoutonMenu = titre
                } completion: {
                    montrerMenu = false
                }
            }, label: {
                HStack(spacing: 15) {
                    Image(systemName: image)
                        .font(.system(size: 16))
                    
                    Text(titre)
                        .font(.system(size: 16))
                }
                .foregroundColor(selectionBoutonMenu == titre ? Color .brown : .white)
                .padding(.vertical, 12)
                .padding(.horizontal,20)
                .background(
                    ZStack {
                        if selectionBoutonMenu == titre {
                            Color.white
                                .opacity(selectionBoutonMenu == titre ? 1 : 0)
                                .clipShape(EtiquetteSelectionPerso(coins: [.topRight,.bottomRight], arrondi: 12))
                            // Crée une transition entre les menus pour la barre de selection
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                    }
                    
                )
                
            })
        }
    }
}
//#Preview {
//    //@Namespace static var animation
//    MenuBoutons(image: "home", titre: "home", selectionBoutonMenu: .constant("Triangle"), montrerMenu: .constant(true), animation: animation)
//}


struct MenuBoutons_Previews: PreviewProvider {
    @Namespace static var animation
    static var previews: some View {
        MenuBoutons(image: "home", titre: "home", selectionBoutonMenu: .constant("Triangle"), montrerMenu: .constant(true), animation: animation)
    }
}
