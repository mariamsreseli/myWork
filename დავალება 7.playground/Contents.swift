import Foundation

//1.შექმენით Enum-ი სახელით WeekDay შესაბამისი ქეისებით. დაწერეთ ფუნქცია რომელიც იღებს ამ ენამის ტიპს და ბეჭდავს გადაწოდებული დღე სამუშაოა თუ დასვენების.

enum WeekDay {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}
func specificDay(day: WeekDay) {
    switch day {
    case .monday:
        print("working 9 to 5")
    case .tuesday:
        print("working 9 to 5")
    case .wednesday:
        print("working 9 to 5")
    case .thursday:
        print("working 9 to 5")
    case .friday:
        print("working 9 to 5")
    case .saturday:
        print("resting🍾")
    case .sunday:
        print("resting🍾")
    }
}
    specificDay(day: .wednesday)
    
    
    //2.შექმენით Enum-ი სახელად GialaSquad, რომელიც აღწერს გია სურამელაშვილის ფანკლუბის წევრების დონეებს ქეისებით : “TsigroviManto”, “MoshishvlebuliMkerdi”, “TuGapatio”. შექმენით ფროფერთი GialaSquad-ში, რომელსაც ექნება ინფორმაცია თუ რა ღირს თითოეული დონე თვეში (დონეები დალაგებულია ძვირიდან იაფისაკენ). დაუმატეთ მეთოდი რომელიც დაბეჭდავს თითოეული დონის ფასს.
    
    enum GialaSquad{
        case TsigroviManto
        case MoshishvlebuliMkerdi
        case TuGapatio
    }
    func priceOfSquad(price: GialaSquad) {
        switch price {
        case .TsigroviManto:
            print("TsigroviManto: 700 GEL")
        case .MoshishvlebuliMkerdi:
            print("MoshishvlebuliMkerdi: 500 GEL")
        case .TuGapatio:
            print("TuGapatio: 300 GEL")
        }
    }
    priceOfSquad(price: .TuGapatio)
    
    
    //3.შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით.
    enum Weather {
        case sunny(Int)
        case cloudy(Int)
        case rainy(Int)
        case snowy(Int)
    }
    func raChavicva(for amindi: Weather) {
        switch amindi {
        case .sunny(let celsius):
            if celsius > 28 {
                print("ძალიან ცხელა, რაც შეიძლება თხლად ჩაიცვი")
            } else {
                print("მზიანი ამინდია, ჟაკეტი არ დაგჭირდება")
            }
        case .cloudy(let celsius):
            print("მოღრუბლული ამინდია, მოსაცმელიც წამოიყოლე")
        case .rainy(let celsius):
            print("წვიმს, საწვიმარი არ დაგრჩეს")
        case .snowy(let celsius):
            if celsius < 6 {
                print("ძალიან ცივა გარეთ, რაც შეიძება თბილად ჩაიცვი")
            } else {
                print("საკმაოდ ცივა, ქურთუკი ჩაიცვი")
            }
            
        }
    }
    
    let amindiaxla = Weather.cloudy(20)
    raChavicva(for: amindiaxla)
    
    
    //4.შექმენით struct-ი Kanye, ფროფერთებით: album, releaseYear. ამის შემდეგ შექმენით array-ი Kanye-ს ტიპის, ჩაამატეთ რამოდენიმე Kanye-ს ობიექტი, და შეავსეთ მასივი კანიეებით. დაწერეთ ფუნქცია, რომელიც მიიღებს ამ კანიეების მასივს და წელს. ფუნქციამ უნდა დაგვიბრუნოს ყველა ალბომი რომელიც გამოშვებულია გადაწოდებული წლის შემდეგ და დაბეჭდოს ისინი.
    struct Kanye {
        var album: String
        var releaseYear: Int
    }
    
    func albumsName(_ KanyeArray: [Kanye], _ year: Int) -> [String] {
        var albumsAfter = [String]()
        for Kanye in KanyeArray  {
            if Kanye.releaseYear > year {
                albumsAfter.append(Kanye.album)
            }
        }
        return albumsAfter
    }
    
    let KanyeArray = [
        Kanye(album: "The College Dropout", releaseYear: 2004),
        Kanye(album: "Late Registration", releaseYear: 2005),
        Kanye(album: "Graduation", releaseYear: 2007),
        Kanye(album: "808s & Heartbreak", releaseYear: 2008),
        Kanye(album: "My Beautiful Dark Twisted Fantasy", releaseYear: 2010),
        Kanye(album: "Watch the Throne", releaseYear: 2011),
        Kanye(album: "Yeezus", releaseYear: 2013),
        Kanye(album: "The Life of Pablo", releaseYear: 2016),
        Kanye(album: "Ye", releaseYear: 2018),
        Kanye(album: "Jesus Is King", releaseYear: 2019),
        Kanye(album: "Vultures 1", releaseYear: 2024)
    ]
    
    let year = 2015
    let album2015 = albumsName(KanyeArray, year)
    print(album2015)
    
    
    //5.შექმენით String-ის ტიპის lazy property wrapper სახელად, cachedData. ინიციალიზება გაუკეთეთ ქლოჟერით რომელიც აბრუნებს სტრინგს მნიშვნელობით “lazy ინიციალიზებულია”. მიწვდით ამ ფროფერთის და დაბეჭდეთ მისი მნიშვნელობა
    
    @propertyWrapper
    struct CatchedData {
        
        lazy var value: String = self.initializer()
        let initializer: () -> String
        
        init(wrappedValue initializer: @escaping @autoclosure () -> String) {
            self.initializer = initializer
        }
        var wrappedValue: String {
            mutating get {
                return value
            }
        }
    }
    struct someStruct {
        @CatchedData var catchedData: String = "lazy ინიციალიზებულია";
    }
    var data = someStruct()
    print(data.catchedData)

