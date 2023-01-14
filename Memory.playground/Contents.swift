import UIKit

class Person{
    let name: String
    var apartment: Apartment?
    
    init(name: String){
        self.name = name
        print("Person \(name) is being initialized")
    }
    
    deinit{
        print("Person \(name) is being deinitialized")
    }
}

class Apartment{
    let name: String
    weak var tenant: Person?
    
    init(name: String){
        self.name = name
        print("Apartment \(name) is being initialized")
    }
    
    deinit{
        print("Apartment \(name) is being deinitialized")
    }
}

var oscar: Person?
var house: Apartment?

oscar = Person(name: "Oscar")
house = Apartment(name: "casita")

oscar?.apartment = house
house?.tenant = oscar

oscar = nil
house = nil
// como hay una referencia cruzada, no se puede eliminar los objetos.
// Al poner weark, en la definición de un parámetro, su puede eliminar el objeto aunque existe una relación cruzada...
