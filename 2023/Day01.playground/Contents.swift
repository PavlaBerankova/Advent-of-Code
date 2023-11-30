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
    return "Result of part one is."
}

func part2() -> String {
    return "Result of part two is."
}

part1()
part2()
