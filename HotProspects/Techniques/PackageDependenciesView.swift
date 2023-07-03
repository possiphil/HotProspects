//
//  PackageDependenciesView.swift
//  HotProspects
//
//  Created by Philipp Sanktjohanser on 21.01.23.
//

import SamplePackage
import SwiftUI

struct PackageDependenciesView: View {
    let possibleNumbers = Array(1...60)
    
    var body: some View {
        Text(results)
    }
    
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.joined(separator: ", ")
    }
}

struct PackageDependenciesView_Previews: PreviewProvider {
    static var previews: some View {
        PackageDependenciesView()
    }
}
