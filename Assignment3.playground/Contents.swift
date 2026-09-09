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

let fahrenheit = c2f(25)
print("25C is \(fahrenheit)F")

let celsius = f2c(77)
print("77F is \(celsius)C")


//: ## Higher-order function

// temperature: the Int to convert
// using converter: the function/closure to use, it takes an Int and returns a Double
// -> Double: what convertTemperature returns
func convertTemperature(_ temperature: Int, using converter: (Int) -> Double) -> Double {
    return converter(temperature)
}

let tempInF = convertTemperature(25, using: c2f)  // 25C to F
print("25C = \(tempInF)F")

let tempInC = convertTemperature(77, using: f2c)  // 77F to C
print("77F = \(tempInC)C")


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

let tempInK = convertTemperature(0, using: c2k)  // 0C to K
print("0°C = \(tempInK) K")

let kelvinToC = convertTemperature(273, using: k2c)  // 273 K to C
print("273 K = \(kelvinToC) °C")

let fToK = convertTemperature(32, using: f2k)  // 32F to K
print("32°F = \(fToK) K")

let kToF = convertTemperature(300, using: k2f)  // 300 K to F
print("300 K = \(kToF) F")
