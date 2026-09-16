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
 How my property wrapper handles it:
 The behavior I defined is that NonEmpty refuses to store an empty string.
 If you try to set firstName or lastName to "", the setter ignores it,
 keeps the old value, and prints a warning so you know it was rejected.

 What happened in my tests:
 I set student.firstName = "" and it stayed "john". I set student.lastName = ""
 and it stayed "Garcia". Nothing crashed, it just printed the warning.
 When I created a student with an empty first name, there was no old value
 to keep, so the wrapper used "Unknown" instead.
 */
