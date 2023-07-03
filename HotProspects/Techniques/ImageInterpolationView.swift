//
//  ImageInterpolationView.swift
//  HotProspects
//
//  Created by Philipp Sanktjohanser on 20.01.23.
//

import SwiftUI

struct ImageInterpolationView: View {
    var body: some View {
        Image("example")
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(.black)
            .ignoresSafeArea()
    }
}

struct ImageInterpolationView_Previews: PreviewProvider {
    static var previews: some View {
        ImageInterpolationView()
    }
}
