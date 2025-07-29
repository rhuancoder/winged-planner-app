//
//  ContentView.swift
//  WingedPlanner
//
//  Created by Rhuan Carvalho on 24/07/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        Text("Winged Planner")
            .bold()
            .italic()
            .foregroundStyle(.green)
        
        
        NavigationView {
            VStack {
                List {
                    HStack {
                        Image(systemName: "circle")
                        
                        Text("Tarefa 1")
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Image(systemName: "circle")
                        
                        Text("Tarefa 2")
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Image(systemName: "circle")
                        
                        Text("Tarefa 3")
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Image(systemName: "circle")
                        
                        Text("Tarefa 4")
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Image(systemName: "circle")
                        
                        Text("Tarefa 5")
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Image(systemName: "circle")
                        
                        Text("Tarefa 6")
                            .foregroundColor(.gray)
                    }
                }
                .navigationTitle("Minhas Tarefas")
            }
        }
    }
}

#Preview {
    ContentView()
}
