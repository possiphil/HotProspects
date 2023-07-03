//
//  CustomTabView.swift
//  HotProspects
//
//  Created by Philipp Sanktjohanser on 18.01.23.
//

import SwiftUI

struct CustomTabView: View {
    var body: some View {
        TabView {
            Text("Tab 1")
            Text("Tab 2")
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
