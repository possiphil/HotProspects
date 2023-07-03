//
//  CustomRowSwipeActionView.swift
//  HotProspects
//
//  Created by Philipp Sanktjohanser on 21.01.23.
//

import SwiftUI

struct CustomRowSwipeActionView: View {
    var body: some View {
        List {
            Text("Taylor Swift")
                .swipeActions {
                    Button(role: .destructive) {
                        print("Deleting")
                    } label: {
                        Label("Delete", systemImage: "minus.cirlce")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button {
                        print("Pinning")
                    } label: {
                        Label("Pin", systemImage: "pin")
                    }
                    .tint(.orange)
                }
        }
    }
}

struct CustomRowSwipeActionView_Previews: PreviewProvider {
    static var previews: some View {
        CustomRowSwipeActionView()
    }
}
