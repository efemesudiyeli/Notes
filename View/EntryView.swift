//
//  EntryView.swift
//  NotesApp
//
//  Created by Efe Mesudiyeli on 25.02.2025.
//

import SwiftUI

struct EntryView: View {
    let title: String
    let description: String
    let date: Date
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .bold()
                    .font(.title2)
                Text(date, format: .dateTime)
                    .font(.caption)
                    .foregroundStyle(.gray.opacity(0.8))
            }
            
            Text(description)
                .multilineTextAlignment(.leading)
                .font(.body)
                .lineSpacing(4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundStyle(Color.primary)
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
        .padding(.horizontal, 2)
    }
}

#Preview {
    EntryView(
        title: "Test Title",
        description: "The description of the note",
        date: Date()
    )
}
