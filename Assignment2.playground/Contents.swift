/*:
 
 #Assignment: 2
 * Angel Garcia
 * 9/1/2026
 
 */
let names = ["Anna": 18, "Alex": 9, "Brian": 67, "Jack": 34]
let greetings = ["Hello", "Good morning", "Hey", "Hi", "Bonjour"]

for (name, age) in names {
    let randomG = Int.random(in: 0..<greetings.count)
    let randomGreeting = greetings[randomG]
    
    let ageRange: String
    switch age {
    case 0...17:
        ageRange = "Child"
    case 18...30:
        ageRange = "Young adult"
    case 31...64:
        ageRange = "Adult"
    default:
        ageRange = "Senior"
    }
    
    print("\(randomGreeting), \(name) \(age)th birthday! You are a \(ageRange)")
    //I learnt I had to index inside the loop otherwise it would apply the randomg greeting to all the different names in the array. That had to be the biggest syntax error that took me a while to figure out. 
    
}


