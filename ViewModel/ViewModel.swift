//
//  ViewModel.swift
//  NotesApp
//
//  Created by Efe Mesudiyeli on 25.02.2025.
//

import Foundation

class NotesViewModel: ObservableObject {
    
    @Published var notes: [Note] = []
    @Published var addNoteIsPresented: Bool = false
    
    init() {
        fetchNotesFromUserDefaults()
    }
    
    func addNote(title: String, description: String) -> Void {
        
        let newNote = Note(title: title, description: description, date: Date())
        notes.append(newNote)
        saveNotesToUserDefaults()
    }
    
    private func saveNotesToUserDefaults() {
        do {
            let encoder = JSONEncoder()
            let encodedNotes = try encoder.encode(notes)
            UserDefaults.standard.set(encodedNotes, forKey: "SavedNotes")
        } catch {
            print("Failed to save notes: \(error.localizedDescription)")
        }
    }
    
    private func fetchNotesFromUserDefaults() {
        let defaults = UserDefaults.standard
        let decoder = JSONDecoder()
        
        if let savedNotes = defaults.data(forKey: "SavedNotes"),
            let decodedNotes = try? decoder.decode(
                [Note].self,
                from: savedNotes
            ) {
                notes = decodedNotes
            print("Notes successfully loaded from UserDefaults")
        } else {
            print("Failed to fetch notes or no data found.")
        }
}
}
