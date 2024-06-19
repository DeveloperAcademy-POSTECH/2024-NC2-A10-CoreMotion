//
//  ContentView.swift
//  2024-NC2-A10-CoreMotion
//
//  Created by Hyungeol Lee on 6/15/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingExporter = false
    @StateObject var watchConnector = WatchConnector()
   
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("Received message: \(watchConnector.message)")
            ShareLink(item:watchConnector.exportDictionaryToCSV()) {
                            Label("Export CSV", systemImage: "list.bullet.rectangle.portrait")
                        }
        }
        .padding()
    }

}

#Preview {
    ContentView()
}

