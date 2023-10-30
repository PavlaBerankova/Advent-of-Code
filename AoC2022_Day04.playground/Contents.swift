import Foundation

var lines = [String]()

if let filepath = Bundle.main.path(forResource: "input04", ofType: "txt") {
    do {
        var data = try String(contentsOfFile: filepath).components(separatedBy: "\n").compactMap { $0.isEmpty ? nil : $0 }
            lines = data
    } catch {
         print("File not loaded")
    }
}

//print(lines)
func part1() -> String {
    var result = 0
    for line in lines {
        let separateNumbers = line.components(separatedBy: CharacterSet(charactersIn: "-,"))

        var firstElfRange = [Int]()
        var secondElfRange = [Int]()

        firstElfRange.append(Int(separateNumbers[0])!)
        firstElfRange.append(Int(separateNumbers[1])!)

        secondElfRange.append(Int(separateNumbers[2])!)
        secondElfRange.append(Int(separateNumbers[3])!)

        var firstElfSections = [Int]()
        var secondElfSections = [Int]()

        for i in (firstElfRange.first!...firstElfRange.last!) {
            firstElfSections.append(i)
        }

        for i in (secondElfRange.first!...secondElfRange.last!) {
            secondElfSections.append(i)
        }

        if (Set(firstElfSections).isSubset(of: Set(secondElfSections))) ||  (Set(secondElfSections).isSubset(of: Set(firstElfSections))) {
            result += 1
        }
    }
    return("Result of part 1 is \(result).")
}

func part2() -> String {
    var result = 0
    for line in lines {
        let separateNumbers = line.components(separatedBy: CharacterSet(charactersIn: "-,"))

        var firstElfRange = [Int]()
        var secondElfRange = [Int]()

        firstElfRange.append(Int(separateNumbers[0])!)
        firstElfRange.append(Int(separateNumbers[1])!)

        secondElfRange.append(Int(separateNumbers[2])!)
        secondElfRange.append(Int(separateNumbers[3])!)

        var firstElfSections = [Int]()
        var secondElfSections = [Int]()

        for i in (firstElfRange.first!...firstElfRange.last!) {
            firstElfSections.append(i)
        }

        for i in (secondElfRange.first!...secondElfRange.last!) {
            secondElfSections.append(i)
        }

        let bothElfSection = Set(firstElfSections).intersection(Set(secondElfSections))
        if !bothElfSection.isEmpty {
            result += 1
        }
            
    }
    return("Result of part 1 is \(result).")
}

part1()
part2()


