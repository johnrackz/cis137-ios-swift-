/*:

 #Assignment: 4
 * Angel Garcia
 * 9/15/2026

 */

// @propertyWrapper = this struct wraps a String and controls how it gets read/set
@propertyWrapper
struct NonEmpty {
    // the actual stored String, hidden behind the wrapper
    private var value: String

    // wrappedValue = what you get/set when you use @NonEmpty var someName
    var wrappedValue: String {
        get { value }
        set {
            if newValue.isEmpty {
                // reject the empty string, keep the old value, warn instead of crashing
                print("NonEmpty: rejected empty string, keeping \"\(value)\"")
            } else {
                value = newValue
            }
        }
    }

    // init(wrappedValue:) runs when the property is first created, e.g. Student(firstName: "john", ...)
    init(wrappedValue: String) {
        if wrappedValue.isEmpty {
            // no valid starting value was given, fall back to "Unknown" and warn
            print("NonEmpty: rejected empty string, keeping \"Unknown\"")
            self.value = "Unknown"
        } else {
            self.value = wrappedValue
        }
    }
}

struct Student {
    @NonEmpty var firstName: String
    @NonEmpty var lastName: String
}


//: ## Testing

var student = Student(firstName: "john", lastName: "Garcia")
print("firstName: \(student.firstName)")
print("lastName: \(student.lastName)")

student.firstName = ""
print("firstName after empty set: \(student.firstName)")

student.lastName = ""
print("lastName after empty set: \(student.lastName)")

student.lastName = "Smith"
print("lastName after valid set: \(student.lastName)")

let blank = Student(firstName: "", lastName: "john")
print("blank.firstName: \(blank.firstName)")
print("blank.lastName: \(blank.lastName)")

/*
 For this assignment I defined a property wrapper called NonEmpty that
 stops a String property from ever being set to "". If I try to assign
 an empty string, the setter just keeps whatever value was already there
 and prints a warning instead of crashing or silently storing "".

 In my tests, setting student.firstName = "" left it as "john", and
 setting student.lastName = "" left it as "Garcia" - both printed a
 warning but nothing broke. When I made a new Student with an empty
 firstName ("", "john"), the wrapper had nothing valid to fall back on
 yet, so init used the default "Unknown" instead.

 I like this approach because the property can never actually hold "",
 there's no crash, and I still get a printed warning so I know the
 empty assignment was rejected instead of it failing silently.

 Behind the scenes, firstName and lastName are really stored as
 _firstName and _lastName, which are instances of the NonEmpty wrapper
 itself - that's where the real value and the rejection logic live.
 */
