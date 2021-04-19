//
//  OrderStruct.swift
//  CupcakeCorner
//
//  Created by Brandon Knox on 4/17/21.
//

import Foundation


//For a more challenging task, see if you can convert our data model from a class to a struct, then create an ObservableObject class wrapper around it that gets passed around. This will result in your class having one @Published property, which is the data struct inside it, and should make supporting Codable on the struct much easier.

class Order: ObservableObject {
    @Published var order = OrderStruct()
}

struct OrderStruct: Codable {
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    }
    
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
}
