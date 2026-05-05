//
//  ContentView.swift
//  WingedPlanner
//
//  Created by Rhuan Carvalho on 24/07/25.
//

import SwiftUI



struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var showingAddTask = false
    @State private var showingArchives = false
    @State private var tasks: [TaskModel] = TaskStorage.shared.loadTasks()
    @State private var editingTask: TaskModel?
    
    private var backgroundColor: Color {
        colorScheme == .dark ? Color(.black).opacity(0.9) : .white
    }
    
    private var activeTasks: [TaskModel] {
        tasks.filter { !$0.isArchived }
    }
    
    private func saveTasks() {
        TaskStorage.shared.saveTasks(tasks)
    }
    
    private func archiveTask(_ task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isArchived = true
        }
    }
    
    private func deleteTask(_ task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks.remove(at: index)
        }
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Winged Planner")
                .font(.custom("Blackrush", size: 60))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.purple, .indigo],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 10)
        .background(backgroundColor)
        
        NavigationStack {
            List(activeTasks) { task in
                HStack {
                    Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                        .foregroundStyle(.primary)
                        .onTapGesture {
                            archiveTask(task)
                        }
                    
                    Text(task.title)
                        .foregroundStyle(.primary)
                }
                .onLongPressGesture(minimumDuration: 0.5) {
                    self.editingTask = task
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                    Button(role: .destructive) {
                        deleteTask(task)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
            .listStyle(.plain)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("My Tasks")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        showingArchives = true
                    }) {
                        Image(systemName: "archivebox")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showingAddTask = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $showingAddTask) {
            AddTaskView(tasks: $tasks)
        }
        .sheet(item: $editingTask) { task in
            EditTaskView(task: task) { updatedTask in
                if let index = tasks.firstIndex(where: { $0.id == updatedTask.id }) {
                    tasks[index] = updatedTask
                    saveTasks()
                }
            }
        }
        .sheet(isPresented: $showingArchives) {
            ArchivesView(tasks: $tasks)
        }
        .onChange(of: tasks) {
            saveTasks()
        }
    }
}

#Preview {
    ContentView()
}
