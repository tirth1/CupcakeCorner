//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Tirth on 10/25/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cupcakes: \(order.quantity)", value: $order.quantity, in: 1...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled == true {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting.animation())
                        Toggle("Add extra sprinkles", isOn: $order.extraSprinkles.animation())
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }                
            }
            .padding(.top)
            .navigationTitle("Cupcake Corner")
            .preferredColorScheme(.dark)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
