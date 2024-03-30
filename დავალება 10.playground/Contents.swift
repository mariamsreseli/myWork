import Foundation

//1. შექმენით ციკლური რეფერენცები და გაწყვიტეთ

class Person {
    var name: String
    var car: Car?
    
    init(name: String, car: Car? = nil) {
        self.name = name
        self.car = car
    }
    
    deinit {
        print("\(name) დეინიცირებულია.")
    }
}


class Car {
    var brand: String
    weak var owner: Person?
    
    init(brand: String, owner: Person? = nil) {
        self.brand = brand
        self.owner = owner
    }
    
    deinit {
        print("მანქანის ბრენდი \(brand) დეინიცირებულია.")
    }
}

var mariam: Person?
var audi: Car?

mariam = Person(name: "მარიამ სრესელი")
audi = Car(brand: "აუდი")

mariam!.car = audi
audi!.owner = mariam

mariam = nil
audi = nil


//2. აუცილებელია ქლოჟერების გამოყენება
class Person1 {
    let name1: String
    var car1: (() -> Car)?
    
    init(name1: String, car1: ( () -> Car)? = nil) {
        self.name1 = name1
        self.car1 = car1
    }
    
    deinit {
        print("\(name1) დეინიზირებულია.")
    }
}


class Car1 {
    let brand1: String
    var owner1: (() -> Person)?
    
    init(brand1: String, owner1: ( () -> Person)? = nil) {
        self.brand1 = brand1
        self.owner1 = owner1
    }
    
    deinit {
        print("მანქანის ბრენდი \(brand1) დეინიცირებულია.")
    }
}

var ana: Person1?
var mercedes: Car1?

ana = Person1(name1: "ანა შავაძე")
mercedes = Car1(brand1: "მერსედესი")

ana = nil
mercedes = nil


//3. აუცილებელია value და რეფერენს ტიების გამოყენება (კლასები, სტრუქტურები, ენამები და პროტოკოლები)

protocol CarProtocol: Any {
    func ownerFunc(_ owner3: PersonProtocol)
}

protocol PersonProtocol: Any {
    func buyCar(_ car3: CarProtocol)
}

class Person3: PersonProtocol {
    var name3: String
    var car3: CarProtocol?
    
    init(name3: String, car3: CarProtocol? = nil) {
        self.name3 = name3
        self.car3 = car3
    }
    
    func buyCar(_ car3: any CarProtocol) {
        self.car3 = car3
    }
    
    deinit {
        print("\(name3) დეინიცირებულია.")
    }
}


class Car3: CarProtocol {
    func ownerFunc(_ owner3: any PersonProtocol) {
    }
    
    var brand3: String
    var owner3: PersonProtocol?
    
    init(brand3: String, owner3: PersonProtocol? = nil) {
        self.brand3 = brand3
        self.owner3 = owner3
    }
    
    func ownerFunc(_owner3: PersonProtocol) {
    }
    
    deinit {
        print("მანქანის ბრენდი \(brand3) დეინიცირებულია.")
    }
}


var tornike: Person3?
var porsche: Car3?

tornike = Person3(name3: "თორნიკე")
porsche = Car3(brand3: "პორშე")

tornike?.buyCar(porsche!)
porsche?.ownerFunc(tornike!)

tornike = nil
porsche = nil



//4. აუცილებელია გამოიყენოთ strong, weak & unowned რეფერენსები ერთხელ მაინც


class Person4 {
    var name4: String
    var car4: Car4?
    
    init(name4: String, car4: Car4? = nil) {
        self.name4 = name4
        self.car4 = car4
    }
    
    deinit {
        print("\(name4) დეინიცირებულია.")
    }
}

class Car4 {
    var brand4: String
    weak var owner4: Person4?
    
    init(brand4: String, owner4: Person4? = nil) {
        self.brand4 = brand4
        self.owner4 = owner4
    }
    
    deinit {
        print("მანქანის ბრენდი \(brand4) დეინიცირებულია.")
    }
}

var eka: Person4?
var ford: Car4?

eka = Person4(name4: "ეკა")
ford = Car4(brand4: "ფორდი")

eka!.car4 = ford
ford!.owner4 = eka

eka = nil
ford = nil

//5. დაიჭირეთ self ქლოჟერებში

class Person5 {
    let name5: String
    var car5: (() -> Car5)?
    
    init(name5: String, car5: ( () -> Car5)? = nil) {
        self.name5 = name5
        self.car5 = car5
    }
    
    deinit {
        print("\(name5) დეინიზირებულია.")
    }
}


class Car5 {
    let brand5: String
    var owner5: (() -> Person)?
    
    init(brand5: String, owner5: ( () -> Person)? = nil) {
        self.brand5 = brand5
        self.owner5 = owner5
    }
    
    deinit {
        print("მანქანის ბრენდი \(brand5) დეინიცირებულია.")
    }
}

var beka: Person5?
var ferrari: Car5?

beka = Person5(name5: "ბექა სრესელი")
ferrari = Car5(brand5: "ფერარი")

beka = nil
ferrari = nil


//6. გატესტეთ მიღებული შედეგები ინსტანსების შექმნით და დაპრინტვით
// თითოეული ფუნქციის ქვემოთ მაქვს მოყვანილი მაგალითი, როგორც მივხვდი მე-6 დავალებაც ამას გვთხოვს ^^
