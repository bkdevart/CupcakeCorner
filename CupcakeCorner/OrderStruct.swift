//
//  OrderStruct.swift
//  CupcakeCorner
//
//  Created by Brandon Knox on 4/17/21.
//

import Foundation


//For a more challenging task, see if you can convert our data model from a class to a struct, then create an ObservableObject class wrapper around it that gets passed around. This will result in your class having one @Published property, which is the data struct inside it, and should make supporting Codable on the struct much easier.
/*
 struct Response: Codable {
     var results: [Result]
 }

 struct Result: Codable {
     var trackId: Int
     var trackName: String
     var collectionName: String
 }

 struct ContentView: View {
     @State var results = [Result]()
     
     var body: some View {
         List(results, id: \.trackId) { item in
             VStack(alignment: .leading) {
                 Text(item.trackName)
                     .font(.headline)
                 
                 Text(item.collectionName)
             }
         }
     }
 }
 */

class OrderStruct: ObservableObject {
    @Published var order = OrderS()
    
//    init() {
//
//    }
    
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        type = try container.decode(Int.self, forKey: .type)
//        quantity = try container.decode(Int.self, forKey: .quantity)
//
//        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
//        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
//
//        name = try container.decode(String.self, forKey: .name)
//        streetAddress = try container.decode(String.self, forKey: .streetAddress)
//        city = try container.decode(String.self, forKey: .city)
//        zip = try container.decode(String.self, forKey: .zip)
//    }
    
}

struct OrderS: Codable {
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    }
//        let id = UUID()
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    func hasAllSpaces(myString: String) -> Bool {
        var checkChars = ""
        for char in myString {
            if char == " " {
                checkChars.append(char)
            }
        }
        if checkChars.count == myString.count {
            print("All spaces")
            return true
        } else {
            print("Has non-space characters")
            return false
        }
    }
    
    var hasValidAddress: Bool {

        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }

        if hasAllSpaces(myString: name) || hasAllSpaces(myString: streetAddress) || hasAllSpaces(myString: city) || hasAllSpaces(myString: zip) {
            return false
        }
        
        return true
    }
    
    var cost: Double {
        var cost = Double(quantity) * 2
        cost += Double(type) / 2
        
        if extraFrosting {
            cost += Double(quantity)
        }
        
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkles)
        
        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
    }
}