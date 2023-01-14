import UIKit

class VehicleClass {
    let name: String
    var numberOfWeels: Int
    
    init(name: String, numberOfWeels: Int){
        self.name = name
        self.numberOfWeels = numberOfWeels
    }
}

struct VehicleStruct {
    let name: String
    var numberOfWhells: Int
}

var vehicleClass: VehicleClass = VehicleClass(name: "Citroen", numberOfWeels: 4)
var vehicleClasssCopy = vehicleClass

vehicleClasssCopy.numberOfWeels = 8
print(vehicleClass.numberOfWeels)

var vehicleStruct: VehicleStruct = VehicleStruct(name: "Ford", numberOfWhells: 12)
