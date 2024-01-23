//
//  VueCecle.swift
//  Tests menu slider
//
//  Created by Philippe MICHEL on 18/01/2024.
//

import SwiftUI

struct VueCecle: View {
    var body: some View {
        Circle()
            .fill(.brown)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .frame(width: 200,height: 200)
    }
}

#Preview {
    VueCecle()
}
