//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Brandon Knox on 4/14/21.
//

import SwiftUI

class User: ObservableObject, Codable {
    @Published var name = "Paul Hudson"
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
