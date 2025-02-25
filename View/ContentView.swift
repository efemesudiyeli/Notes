//
//  ContentView.swift
//  NotesApp
//
//  Created by Efe Mesudiyeli on 25.02.2025.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var notesViewModel: NotesViewModel
    
    var body: some View {
        Text("Notes")
            .font(.system(size: 32, weight: .bold))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .background(
                Color(.systemBackground)
                    .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
            )
        
        List(
            content: {
                ForEach(notesViewModel.notes) { Note in
                    EntryView(
                        title: Note.title,
                        description: Note.description,
                        date: Note.date
                    )
                }
            })
        .listStyle(.plain)
        .sheet(isPresented: $notesViewModel.addNoteIsPresented) {
            AddNoteView(notesViewModel: notesViewModel)
                .presentationDetents([.height(400)])
        }
        
        Button {
            notesViewModel.addNoteIsPresented = true
        } label: {
            Image(systemName: "plus")
                .foregroundStyle(.white)
                .font(.system(size: 24, weight: .semibold))
                .frame(width: 60, height: 60)
                .background(
                    Circle()
                        .fill(Color.blue)
                        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                )
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 16)
        .ignoresSafeArea(edges: .all)
        
    }
}

#Preview {
    ContentView(notesViewModel: NotesViewModel())
}
