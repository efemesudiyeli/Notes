//
//  AddNoteView.swift
//  NotesApp
//
//  Created by Efe Mesudiyeli on 25.02.2025.
//

import SwiftUI

struct AddNoteView: View {
    @ObservedObject var notesViewModel: NotesViewModel
    @State var title: String = ""
    @State var description: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Başlık")
                            .foregroundStyle(.gray)
                            .font(.subheadline)
                        TextField("Not başlığını girin", text: $title)
                            .font(.title3)
                            .padding()
                            .background(Color(.systemGray6))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Not")
                            .foregroundStyle(.gray)
                            .font(.subheadline)
                        TextEditor(text: $description)
                            .frame(height: 200)
                            .padding()
                            .background(Color(.systemGray6))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                            )
                    }
                    
                
            
                   
                }
                .padding(.horizontal, 20)
                .padding(.top, 12)
                .padding(.bottom, 32)
            }
            .navigationTitle("Yeni Not")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        notesViewModel.addNoteIsPresented = false
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.gray)
                            .font(.title3)
                    }
                }

                 ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                          if !title.isEmpty && !description.isEmpty {
                            notesViewModel.addNote(title: title, description: description)
                            notesViewModel.addNoteIsPresented = false
                        }

                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundStyle(.gray)
                            .font(.title3)
                    }.disabled(title.isEmpty || description.isEmpty)
                }
            }
        }
    }
}

#Preview {
    AddNoteView(notesViewModel: NotesViewModel())
}
