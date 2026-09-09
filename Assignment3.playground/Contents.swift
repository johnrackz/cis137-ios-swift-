/*:
 
 #Assignment: 3
 * Angel Garcia
 * 9/8/2026
 
 */

// c2f = name of the closure, (Int) -> Double = takes an Int and returns a Double,
// celsius in = the parameter, after in = the body
let c2f: (Int) -> Double = { celsius in
    Double(celsius) * 9 / 5 + 32
}

// f2c = name, (Int) -> Double = Int in, Double out, fahrenheit = parameter, formula = body
let f2c: (Int) -> Double = { fahrenheit in
    (Double(fahrenheit) - 32) * 5 / 9
}

let fahrenheit = c2f(30)
print("30C is \(fahrenheit)F")

let celsius = f2c(95)
print("95F is \(celsius)C")


//: ## Higher-order function

// temperature: the Int to convert
// using converter: the function/closure to use, it takes an Int and returns a Double
// -> Double: what convertTemperature returns
func convertTemperature(_ temperature: Int, using converter: (Int) -> Double) -> Double {
    return converter(temperature)
}

let tempInF = convertTemperature(40, using: c2f)  // 40C to F
print("40C = \(tempInF)F")

let tempInC = convertTemperature(68, using: f2c)  // 68F to C
print("68F = \(tempInC)C")


//: ## Another unit - Kelvin

// c2k = name, Int celsius in, Double kelvin out
let c2k: (Int) -> Double = { celsius in
    Double(celsius) + 273.15
}

// k2c = name, Int kelvin in, Double celsius out
let k2c: (Int) -> Double = { kelvin in
    Double(kelvin) - 273.15
}

// f2k = name, Int fahrenheit in, Double kelvin out
let f2k: (Int) -> Double = { fahrenheit in
    (Double(fahrenheit) - 32) * 5 / 9 + 273.15
}

// k2f = name, Int kelvin in, Double fahrenheit out
let k2f: (Int) -> Double = { kelvin in
    (Double(kelvin) - 273.15) * 9 / 5 + 32
}

let tempInK = convertTemperature(25, using: c2k)  // 25C to K
print("25C = \(tempInK) K")

let kelvinToC = convertTemperature(300, using: k2c)  // 300 K to C
print("300 K = \(kelvinToC) C")

let fToK = convertTemperature(50, using: f2k)  // 50F to K
print("50F = \(fToK) K")

let kToF = convertTemperature(310, using: k2f)  // 310 K to F
print("310 K = \(kToF) F")
