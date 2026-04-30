//
//  ContentView.swift
//  WingedPlanner
//
//  Created by Rhuan Carvalho on 24/07/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAddTask = false
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Winged Planner")
                .font(.custom("Blackrush", size: 60))
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 10)
        .background(
            LinearGradient(
                colors: [.purple, .indigo],
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        
        NavigationStack {
            List {
                HStack {
                    Image(systemName: "circle")
                    
                    Text("Tarefa 1")
                        .foregroundStyle(.gray)
                }
                
                HStack {
                    Image(systemName: "circle")
                    
                    Text("Tarefa 2")
                        .foregroundStyle(.gray)
                }
                
                HStack {
                    Image(systemName: "circle")
                    
                    Text("Tarefa 3")
                        .foregroundStyle(.gray)
                }
                
                HStack {
                    Image(systemName: "circle")
                    
                    Text("Tarefa 4")
                        .foregroundStyle(.gray)
                }
                
                HStack {
                    Image(systemName: "circle")
                    
                    Text("Tarefa 5")
                        .foregroundStyle(.gray)
                }
                
                HStack {
                    Image(systemName: "circle")
                    
                    Text("Tarefa 6")
                        .foregroundStyle(.gray)
                }
            }
            .listStyle(.plain)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Minhas Tarefas")
            .toolbar {
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
            AddTaskView()
        }
    }
}

#Preview {
    ContentView()
}
