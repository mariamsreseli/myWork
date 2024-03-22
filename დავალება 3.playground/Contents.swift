import UIKit

//1. შექმენით სამი Int ტიპის ცვლადი, მიანიჭეთ მათ მნიშვნელობა და დაბეჭდეთ მათი ნამრავლი.

var number1 = 3
var number2 = 5
var number3 = 2
var multiply = number1 * number2 * number3
print(multiply)

//2. შექმენით int ტიპის ცვლადი, მიანიჭეთ მას მნიშვნელობა და შეამოწმეთ ეს რიცხვი ლუწია თუ კენტი ტერნარი ოპერატორით.
var age = 24
var age1 = age % 2
if age1 == 0 {
    print ("ლუწია")
} else {
    print ("კენტია")
}

//3. შექმენით optional String-ის ტიპის და მიანიჭეთ თქვენი სახელის მნიშვნელობა. If let-ის მეშვეობით გაუკეთეთ unwrap და მნიშვნელობა დაპრინტეთ
var myname: String? = "Mariam"

if let myname {
    print(myname)
}

//4. შექმენით ცვლადი სახელად isRaining ბულეანის ტიპის და მიანიჭეთ თქვენთვის სასურველი მნიშვნელობა. If-else-ის მეშვეობით შეამოწმეთ თუ მნიშვნელობა მიიღებს true მნიშვნელობას დაბეჭდეთ “ქოლგის წაღება არ დამავიწყდეს”, სხვა შემთხვევაში “დღეს ქოლგა არ დამჭირდება”.
var isRaining = false
if isRaining == true {
    print ("ქოლგის წაღება არ დამავიწყდეს")
} else {
    print ("დღეს ქოლგა არ დამჭირდება")
}

//5. შექმენით ორი int ტიპის ცვლადი a & b და მიანიჭეთ სასურველი რიცხვები. If-else-ით შეამოწმეთ თუ a მეტია b-ზე დაბეჭდეთ “a მეტია”,  სხვა შემთხვევაში “b მეტია”
var a = 26
var b = 18
if a > b {
    print("a მეტია")
} else {
    print("b მეტია")
}

//6. შექმენით მუდმივა Character ტიპის და მიანიჭეთ თქვენი სახელის პირველი ასოს მნიშვნელობა.
let name: Character = "M"
print(name)

//7. მოცემულია ორნიშნა რიცხვი, გაიგეთ არის თუ არა ერთიდაიმავე ციფრისგან შემდგარი
var number7 = 47
var number8 = number7 / 10
var number9 = number7 % 10
if number8 == number9 {
    print("ერთიდაიმავე ციფრისგან შემდგარი რიცხვია")
} else {
    print("არ არის ერთიდაიმავე ციფრისგან შემდგარი რიცხვი")
}

// 8. აიღეთ ცვლადი numberOfMonths მიანიჭეთ მნიშვნელობა და იმის მიხედვით თუ მერამდენე თვეა დაბეჭდეთ ის (გაზაფხული, ზაფხული, შემოდგომა, ზამთარი) შესაბამისად.
var numberOfMonths = 12
if numberOfMonths >= 3 && numberOfMonths <= 5 {
    print("გაზაფხული") }
else if numberOfMonths >= 6 && numberOfMonths <= 8 {
    print("ზაფხული") }
else if numberOfMonths >= 9 && numberOfMonths <= 11 {
    print("შემოდგომა") }
else if numberOfMonths >= 1 && numberOfMonths <= 2 || numberOfMonths == 12 {
    print("ზამთარი")
}
