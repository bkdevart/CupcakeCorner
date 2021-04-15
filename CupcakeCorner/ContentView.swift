//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Brandon Knox on 4/14/21.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var order = Order()
    
    var body: some View {
        Text("Hello world")
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
