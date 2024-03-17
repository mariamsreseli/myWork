import Foundation

//1.დაწერეთ ფუნქცია რომელიც პარამეტრად მიიღებს String-ს და დააბრუნებს ბულიანს. ფუნქციამ უნდა შეამოწმოს მიღებული სტრინგი სარკისებურია თუ არა (სიტყვა ან წინადადება რომელიც იკითხება ერთნაირად როგორც თავიდან, ისე ბოლოდან მაგ: “ანა”, “აირევი ივერია”, “მადამ”)

func myWord(_ input: String) -> Bool {
    var reversedWord = String(input.reversed())
    return input == reversedWord
}
var word1 = "მადამ"
print("'\(word1)' სარკისებურია \(myWord(word1))")


/* var word = "მადამ"
var reversedWord = String(word.reversed())

if word == reversedWord {
    print("სარკისებურია")
} else {
    print("არ არის სარკისებური")
}
*/



//2.დაწერეთ ფუნქცია რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას.
func squaredNumbers(_ numbers: [Int]) -> [Int] {
    var squaredNumbers = [Int]()
    for number in numbers {
        var squaredValue = number * number
        squaredNumbers.append(squaredValue)
    }
    return squaredNumbers
}
var numbers = [3,6,7,9,23]
var newNumbers = squaredNumbers(numbers)
print(newNumbers)

//3.დაწერეთ Closure რომელიც გაფილტრავს ლუწ რიცხვებს Int-ების Array-დან.

var someNumbers = [12, 11, 34, 56, 77, 1, 17]
var result = someNumbers.filter{$0 % 2 == 0}
print(result)

//4.დაწერეთ ფუნქცია, რომელიც პარამეტრად იღებს Int-ების მასივს. Escaping closure-ის მეშვეობით დაბეჭდეთ მიწოდებული მასივის ჯამი 5 წამის შემდეგ. დარწმუნდით რომ closure არის escaping და გამოიძახეთ ის მას შემდეგ რაც ფუნქცია დაბრუნდება.
func myNumbers(_ numbers: [Int]) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        var sum = numbers.reduce(0, +)
        print("რიცხვების ჯამია: \(sum)")
    }
}
var numbers1 = [6, 22, 34, 12, 1, 3]
myNumbers(numbers1)
print("დაელოდეთ 5 წამი")

//5.შექმენით  კონტაქტების Dict სადაც key არის სახელი და value ტელეფონის ნომერი, დაამატეთ, დაბეჭდეთ/მოძებნეთ და წაშალეთ კონტაქტი
var contacts: [String: Int] = [
    "Mariam" : 511123123,
    "Guram" : 521123123,
    "Tornike" : 531123123
]
print(contacts)

contacts["Ana"] = 541123123 //დამატება
print(contacts)

print(contacts["Mariam"]!) //მოძებნა

contacts.removeValue(forKey: "Mariam")  //წაშლა
print(contacts)

//6.დაწერეთ ფუნქცია რომელიც პარამეტრად იღებს [String: Int] ტიპის Dictionary-ს და დააბრუნებს ანბანურად დალაგებულ dictionary-ს key ელემენტების მასივს.
func sortedElements(from dictionary: [String: Int]) -> [String] {
    var sortedElements = dictionary.keys.sorted()
    return sortedElements
}
var dictionary: [String: Int] = ["ice cream": 2, "yogurt": 4, "juice": 7]
var myArrey = sortedElements(from: dictionary)
print(myArrey)

//7.შექმენით Double-ების მასივი, შეავსეთ ის თქვენთვის სასურველი რიცხვებით.  loop-ის გამოყენებით იპოვეთ ყველაზე დიდი რიცხვი ამ მასივში და დაბეჭდეთ.
var doubleNumbers = [1.2, 3.7, 2.9, 9.4]
var largestNumb = doubleNumbers[0]
for number in doubleNumbers {
    if number > largestNumb {
        largestNumb = number
    }
}
print(largestNumb)
