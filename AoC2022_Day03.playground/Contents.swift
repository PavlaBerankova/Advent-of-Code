import Foundation

var lines = [String]()

if let filepath = Bundle.main.path(forResource: "input03", ofType: "txt") {
    do {
        var data = try String(contentsOfFile: filepath).components(separatedBy: "\n").filter { !$0.isEmpty }
            lines = data
    } catch {
         print("File not loaded")
    }
}

let charIndex = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

func part1() -> String {
    var sumPriority = 0

    for line in lines {
        let halfLength = line.count / 2

        let firstHalf = line.prefix(halfLength)
        let secondHalf = line.suffix(halfLength)

        // print("First half of Rucksack: \(firstHalf),\nSecond half of Rucksack: \(secondHalf)")

        var firstRucksack = [String]()
        var secondRucksack = [String]()

        for char1 in firstHalf {
            firstRucksack.append(String(char1))
        }

        for char2 in secondHalf {
            secondRucksack.append(String(char2))
        }

        var result = Set(firstRucksack).intersection(Set(secondRucksack))
        // print(result)

        var itemPriority = (charIndex.firstIndex(of: result.first!))!
        sumPriority += itemPriority + 1
    }
    return "Result of part one is \(sumPriority)."
}

func part2() -> String {
    var sumPriority = 0
    var partOfGroup = ""
    var elfGroup = [String]()

    for i in stride(from: 0, to: lines.count - 1, by: 3) {
        for j in i..<(i + 3) {
            partOfGroup += lines[j]
            elfGroup.append(partOfGroup)
            partOfGroup = ""
        }
        var item = Set(elfGroup[0]).intersection(Set(elfGroup[1])).intersection(Set(elfGroup[2]))
        // print("item is: \(item)")

        var itemPriority = charIndex.firstIndex(of: String(item.first!))!
        sumPriority += itemPriority + 1
        elfGroup = [String]()
    }

    return "Result of part two is \(sumPriority)."
}

part1()
part2()
