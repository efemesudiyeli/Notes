//
//  Model.swift
//  NotesApp
//
//  Created by Efe Mesudiyeli on 25.02.2025.
//

import Foundation

struct Note: Identifiable, Codable {
    var id: UUID = UUID()
    var title: String
    var description: String
    var date: Date
}
