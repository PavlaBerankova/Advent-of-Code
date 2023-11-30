import Foundation

var input = [Int]()

if let filepath = Bundle.main.path(forResource: "input", ofType: "txt") {
    do {
        let data = try String(contentsOfFile: filepath)
        input = data.components(separatedBy: .whitespacesAndNewlines).compactMap { Int($0) }
    } catch {
        // Contents could not be loaded
    }
} else {
    print("File not found")
}

func part1(data: [Int]) -> Int {
    var increase = 0
    
    for i in 0..<input.count - 1 {
        if input[i] < input[i+1] {
            increase += 1
        }
    }
    return increase
}

func part2(data: [Int]) -> Int {
    var increase = 0
    var sum = 0
    var totalSum = [Int]()
    
    for index in 0..<input.count - 2 {
        for i in 0...2 {
            sum += input[index + i]
        }
        totalSum.append(sum)
        sum = 0
    }
    
    for result in 0..<totalSum.count - 1 {
        if totalSum[result] < totalSum[result+1] {
            increase += 1
        }
    }
    return increase
}

part1(data: input)
part2(data: input)
