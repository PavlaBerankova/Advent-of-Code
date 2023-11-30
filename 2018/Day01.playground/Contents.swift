import Foundation

var input = [String]()
//var input = ""

if let filepath = Bundle.main.path(forResource: "input", ofType: "txt") {
    do {
        var data = try String(contentsOfFile: filepath)
        //input = data
        input = data.components(separatedBy: .whitespacesAndNewlines)
    } catch {
        // Contents could not be loaded
    }
} else {
    print("File not found")
}

func part1(data: [String]) -> Int {
    var sum = input.compactMap { Int($0) }.reduce(0, +)
    return sum
}


func part2(data: [String]) -> Int {
    var dataInt = data.compactMap { Int($0) }
    var sum = 0
    var result = Set<Int>()
    var found = false

    while !found {
        for i in dataInt {
            sum += i
            if result.contains(sum) {
                found = true
                break
            }
            result.insert(sum)
        }
    }
return sum
}

part1(data: input)
part2(data: input)

