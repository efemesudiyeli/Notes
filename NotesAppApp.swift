//
//  NotesAppApp.swift
//  NotesApp
//
//  Created by Efe Mesudiyeli on 25.02.2025.
//

import SwiftUI

@main
struct NotesAppApp: App {
    @StateObject var notesViewModel: NotesViewModel = NotesViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(notesViewModel: notesViewModel)
               
        }
    }
}
