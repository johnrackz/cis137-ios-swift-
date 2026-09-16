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

// NonEmpty rejects "" in the setter and keeps the old value, so firstName stayed "john"
// and lastName stayed "Garcia" after the empty assignments. An empty name at creation
// falls back to "Unknown". No crash, just a printed warning.
