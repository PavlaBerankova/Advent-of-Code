
import Cocoa

var input = [String]()

if let filepath = Bundle.main.path(forResource: "input", ofType: "txt") {
    do {
        var data = try String(contentsOfFile: filepath)
        input = data.compactMap { String($0) }.filter { $0 != "\n" }

    } catch {
         // Contents could not be loaded
    }
} else {
    print("File not found")
}


func part1(data: [String]) -> Int {
    var floor = 0

    for i in input {
        if i == "(" {
            floor += 1
        } else {
            floor -= 1
        }
    }
    return floor
}


func part2(data: [String]) -> Int {
    var floor = 0
    var convertInput = [Int]()

    for i in input {
        if i == "(" {
            floor += 1
            convertInput.append(floor)
        } else {
            floor -= 1
            convertInput.append(floor)
        }
    }

    return convertInput.firstIndex(of: -1)! + 1
}

part1(data: input)
part2(data: input)


