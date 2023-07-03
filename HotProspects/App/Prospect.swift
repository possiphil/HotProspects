//
//  Prospect.swift
//  HotProspects
//
//  Created by Philipp Sanktjohanser on 21.01.23.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var isContacted = false
}
