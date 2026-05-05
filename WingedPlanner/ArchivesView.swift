import SwiftUI

struct ArchivesView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var tasks: [TaskModel]
    
    var archivedTasks: [TaskModel] {
        tasks.filter { $0.isArchived }
    }
    
    private func unarchiveTask(_ task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isArchived = false
        }
    }
    
    private func deleteTask(_ task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks.remove(at: index)
        }
    }
    
    var body: some View {
        NavigationStack {
            List(archivedTasks) { task in
                HStack {
                    Text(task.title)
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    Button(action: {
                        unarchiveTask(task)
                    }) {
                        Image(systemName: "arrow.uturn.backward")
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Archives")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}
