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
    @State    var MontrerForme:Bool = false
    
    // Pour animation du menu side
    var animation: Namespace.ID
    
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                withAnimation(.spring()) {selectionBoutonMenu = titre
                } completion: {
                    montrerMenu = false
                    //Temps avant d'afficher la fenetre fullScreenCover pour laisser le temps au volet de se refermer.
                    //temps 0.3 avant que montrerForme passe à true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        self.MontrerForme = true
                    }
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
                .padding(.horizontal,60) // 20
                .background(
                    ZStack {
                        if selectionBoutonMenu == titre {
                            Color.white
                                .opacity(selectionBoutonMenu == titre ? 1 : 0)
                                .clipShape(FormeSelectionCustom(coins: [.topRight,.bottomRight], arrondis: 12))
                            // Crée une transition entre les menus pour la barre de selection
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                    }
                    
                )
                
            })
        }
        .fullScreenCover(isPresented: $MontrerForme, onDismiss: fermetureFenetre) {
            switch selectionBoutonMenu {
            case Ressources.Formes.triangle.rawValue:
                VueTriangleBis()
            case Ressources.Formes.cercle.rawValue:
                VueCecle()
            case  Ressources.Formes.carre.rawValue:
                VueCarre()
            case  Ressources.Formes.rectangle.rawValue:
                VueRectangle(verifOrientation: false)
            case Ressources.Formes.capsule.rawValue:
                VueCapsule()
            default:
                // La seule forme qui reste c'est le ovale
                VueOvale()
            }
        }
    }
    
    // Fermeture des fenetres  FullSceenCover et ouverture du menu Slider
    func fermetureFenetre() {
      montrerMenu = true
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
