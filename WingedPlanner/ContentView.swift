//
//  ContentView.swift
//  WingedPlanner
//
//  Created by Rhuan Carvalho on 24/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       NavigationStack {
           List {
               Text("Hello, world!")
               Text("Hello, world!")
           }.navigationTitle("Winged Planner")
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
