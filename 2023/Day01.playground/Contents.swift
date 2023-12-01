import Foundation

var lines = [String]()

if let filepath = Bundle.main.path(forResource: "test01", ofType: "txt") {
    do {
        var data = try String(contentsOfFile: filepath).components(separatedBy: "\n").filter { !$0.isEmpty }
            lines = data
    } catch {
         print("File not loaded")
    }
}

func part1() -> String {
var sum = 0
var stringDigits = String()

    for line in lines { // --> line "nqninenmvnpsz874"
        for char in line {
            if char.isNumber {
                stringDigits += String(char) // --> stringDigits "874"
            }
        }
        var twoDigits: String = String(stringDigits.first ?? "N") + String(stringDigits.last ?? "N") // --> "84"
        sum += Int(twoDigits) ?? 0 // --> sum + 84
        stringDigits = String() // reset
    }
    return "Result of part one is \(sum)."
}

func part2() -> String {
    var sum = 0
    var stringDigits = String()

        for line in lines { // --> line "8twofpmpxkvvdnpdnlpkhseven4ncgkb"
           
        }
    return "Result of part two is \(sum)."
}

part1()
part2()
