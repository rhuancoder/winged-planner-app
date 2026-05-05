import SwiftUI

struct EditTaskView: View {
    @Environment(\.dismiss) var dismiss
    
    let task: TaskModel
    let onSave: (TaskModel) -> Void
    
    @State private var taskTitle: String
    
    init(task: TaskModel, onSave: @escaping (TaskModel) -> Void) {
        self.task = task
        self.onSave = onSave
        self._taskTitle = State(initialValue: task.title)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Enter task name", text: $taskTitle)
                }
            }
            .navigationTitle("Edit Task")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        if !taskTitle.isEmpty {
                            onSave(TaskModel(id: task.id, title: taskTitle, isCompleted: task.isCompleted, isArchived: task.isArchived))
                        }
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    EditTaskView(task: TaskModel(title: "Sample")) { _ in }
}