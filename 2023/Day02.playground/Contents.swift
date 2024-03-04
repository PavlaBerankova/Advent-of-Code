import Foundation

var lines = [String]()

if let filepath = Bundle.main.path(forResource: "test02", ofType: "txt") {
    do {
        var data = try String(contentsOfFile: filepath).components(separatedBy: "\n").filter { !$0.isEmpty }
            lines = data
    } catch {
         print("File not loaded")
    }
}

func part1() -> String {
    let redCube = 12
    let greenCube = 13
    let blueCube = 14
    var sumIdPossible = 0

    for line in lines {
        let newLine = line.components(separatedBy: ";").map { $0.trimmingCharacters(in: .whitespaces) }
        print("Line: \(line)")
        print(newLine)
    }




    return "Result of part one is."
}

struct Game {
    var id: Int
    var blue: Int
    var green: Int
    var red: Int
    var sum: Int
}

func part2() -> String {
    var sum = 0

    return "Result of part two is \(sum)."
}

part1()
// part2()
