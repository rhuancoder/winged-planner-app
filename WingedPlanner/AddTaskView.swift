//
//  AddTaskView.swift
//  WingedPlanner
//
//  Created by Rhuan Carvalho on 24/07/25.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    @State private var taskTitle = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Digite a nova tarefa", text: $taskTitle)
                }
            }
            .navigationTitle("Adicionar Tarefa")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddTaskView()
}