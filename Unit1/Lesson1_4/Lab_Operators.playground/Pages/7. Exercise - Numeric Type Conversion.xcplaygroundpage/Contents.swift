let x = 10
let y : Double = 3.2
let multipliedAsIntegers = x * Int(y)
print(multipliedAsIntegers)
//:  Create a constant `multipliedAsDoubles` equal to `x` times `y`, but this time convert the `Int` to a `Double` in the expression. Print the result.
let multipliedAsDoubles = Double(x) * y
print(multipliedAsDoubles)

//:  Are the values of `multipliedAsIntegers` and `multipliedAsDoubles` different? Print a statement to the console explaining why.
print("The values of the two constants are different")
print("When 3.2 is converted to the Int type, it is rounded down to 3, thus the product of 30 - when multiplied as Integers")
print("However, after converting the Int value, 10 to a Double, the multiplication is not only error-free, but ")
print("the decimals are also retained")

/*:
[Previous](@previous)  |  page 7 of 8  |  [Next: App Exercise - Converting Types](@next)
 */
