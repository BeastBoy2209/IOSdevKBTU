import SwiftUI
// Task 1
let 👤firstName = "Tim"
let lastName = "Kharitonov"
let age = 19
let birthYear = 2005
var isStudent = true
let height = 178.00
let eyeColor: String = "Hazel"
let hairColor: String = "Brown"
let location: String = "Almaty, Kazakhstan"
let currentYear = Calendar.current.component(.year, from: Date())
let ageBonus = currentYear - birthYear
// Task 2
let hobby = "Tennis, Video Games"
let numberOfHobbies = 2
let favoriteNumber = 22
let isHobbyCreative = true
let FavoriteFood: String = "khinkali :)"
let FavoriteCuisine: String = "Georgian"
let FavoriteDrink: String = "CocaCola"
// Task 3
let studentStatus = isStudent ? "I am currently a student" : "I am not a student"
let hobbyCreativity = isHobbyCreative ? "which is a creative hobby" : "which is not a creative hobby"

//Bonus Task
let 🌟futureGoals: String = "In the future, I want to become a professional iOS developer "

let summary = """
My name is \(👤firstName) \(lastName). I am \(age) years old, born in \(birthYear) (\(ageBonus) years ago). \(studentStatus). I am \(height) cm tall, with \(eyeColor) eyes and \(hairColor) hair. I live in \(location). I enjoy \(hobby), \(hobbyCreativity). I have \(numberOfHobbies) hobbies in total, and my favorite number is \(favoriteNumber). My favorite food is \(FavoriteFood), I enjoy \(FavoriteCuisine) cuisine, and my favorite drink is \(FavoriteDrink). \(🌟futureGoals)
"""
//print(summary)

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text(summary)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
