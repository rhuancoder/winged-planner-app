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
        VStack(spacing: 0) {
            VStack(spacing: 2) {
                Text("Winged Planner")
                    .font(.custom("Blackrush", size: 40))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.purple, .indigo],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 2)
            .padding(.bottom, 8)
            .padding(.horizontal, 16)
            .background(backgroundColor)
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.gray.opacity(0.15)),
                alignment: .bottom
            )

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

struct SplashView: View {
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()

            VStack(spacing: 10) {
                Text("Winged Planner")
                    .font(.custom("Blackrush", size: 64))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.purple, .indigo],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .shadow(color: Color.gray.opacity(0.25), radius: 10, x: 0, y: 4)

                Text("Giving wings to your plans")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 32)
        }
    }
}

#Preview {
    ContentView()
}
