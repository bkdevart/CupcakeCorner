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
        Form {
            Section {
                Picker("Select your cake type", selection: $order.type) {
                    ForEach(0..<Order.types.count) {
                        Text(Order.types[$0])
                    }
                }
                
                Stepper(value: $order.quantity, in: 3...20) {
                    Text("Number of cakes: \(order.quantity)")
                }
            }
        }
        .navigationBarTitle("Cupcake Corner")
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
