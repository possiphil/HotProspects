//
//  Prospect.swift
//  HotProspects
//
//  Created by Philipp Sanktjohanser on 21.01.23.
//

import SwiftUI

enum ProspectFilter {
    case name
    case emailAddress
    case isContacted
}

class Prospect: Identifiable, Codable, Comparable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
    
    static func == (lhs: Prospect, rhs: Prospect) -> Bool {
        lhs.name == rhs.name
    }
    
    static func <(lhs: Prospect, rhs: Prospect) -> Bool {
        lhs.name < rhs.name
    }
}

@MainActor final class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    let saveKey = "SavedData"
    let savePath: URL
    
    init() {
        savePath = FileManager.documentsDirectory.appending(path: saveKey)
        
//        if let data = UserDefaults.standard.data(forKey: saveKey) {
//            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
//                people = decoded
//                return
//            }
//        }
        
        do {
            let data = try Data(contentsOf: savePath)
            people = try JSONDecoder().decode([Prospect].self, from: data)
        } catch {
            people = []
        }
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
//            UserDefaults.standard.set(encoded, forKey: saveKey)
            try? encoded.write(to: savePath, options: .atomic)
        }
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    
    func sort(by filter: ProspectFilter) {
        switch filter {
        case .name:         people.sort { $0.name < $1.name }
        case .emailAddress: people.sort { $0.emailAddress < $1.emailAddress }
        case .isContacted:  people.sort { $0.isContacted && !$1.isContacted }
        }
    }
}
