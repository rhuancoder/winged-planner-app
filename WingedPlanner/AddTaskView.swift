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
    @Binding var tasks: [TaskModel]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Enter task name", text: $taskTitle)
                }
            }
            .navigationTitle("Add Task")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if !taskTitle.isEmpty {
                            tasks.append(TaskModel(title: taskTitle))
                        }
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddTaskView(tasks: .constant([
        TaskModel(title: "Sample")
    ]))
}