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

func numberToWord(number: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    if let result = formatter.string(from: NSNumber(value: number)) {
        return result
    }
    return ""
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
    func numberToWord(number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        if let result = formatter.string(from: NSNumber(value: number)) {
            return result
        }
        return ""
    }

    var sum = 0
    var stringDigits = String()

    let wordNumbers = ["one": "1", "two": "2", "three": "3", "four": "4", "five": "5", "six": "6", "seven": "7", "eight": "8", "nine": "9"]
    for (key, value) in wordNumbers {
        for line in lines {
            if line.contains(key) {
                print(key)
                key.replacingOccurrences(of: key, with: value)
            }
            print(line)
        }
    }
    return "Result of part two is \(sum)."
}
part2()

//let wordNumbers = ["one": 1, "two": 2, "three": 3, "four": 4, "five": 5, "six": 6, "seven": 7, "eight": 8, "nine": 9]

//let string1 = "xeighthree"
//
//func firstNumber(from line: String) {
//    for (key, value) in wordNumbers {
//        if let range = line.range(of: key) { // range(of:) hledá první výskyt klíče ve stringu a vrací rozsah range nalezeného klíče nebo nil
//            let startIndex = range.lowerBound // získá dolní mez (první index) nalezeného klíče v řetězci
//            let endIndex = string1.index(startIndex, offsetBy: key.count) // získá horní mez (poslední index) nalezeného klíče v řetězci
//            let foundSubstring = String(string1[startIndex..<endIndex]) // extrahuje substring ze string1 pomocí získaného rozsahu
//            if foundSubstring == key {
//                print(value)
//                break
//            }
//        }
//    }
//}
//firstNumber(from: string1)

//    // Projděte všechny klíče ve slovníku
//    for (key, value) in wordNumbers {
//        // Najděte rozsah (range) v opačném pořadí
//        if let range1 = string1.reversed().range(of: String(key.reversed())) {
//            let foundIndex = string1.index(range1.lowerBound, offsetBy: -1)
//            let foundSubstring = String(string1[..<foundIndex])
//
//            // Upravte hodnotu indexu o 1, protože jsme pracovali s opačným pořadím
//            let keyIndex = string1.distance(from: string1.startIndex, to: foundIndex) - 1
//
//            print("Poslední výskyt klíče: \(key) na pozici \(keyIndex), Hodnota: \(value)")
//            break
//        }
//    }

// part1()

