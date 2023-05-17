import Foundation

var input = [Double]()

if let filepath = Bundle.main.path(forResource: "input", ofType: "txt") {
    do {
        let data = try String(contentsOfFile: filepath)
        input = data.components(separatedBy: .whitespacesAndNewlines).compactMap { Double($0) }
    } catch {
        // Contents could not be loaded
    }
} else {
    print("File not found")
}


func part1(data: [Double]) -> Int {
    
    let fuel = input.compactMap { Int(floor($0/3.0))-2 }
    let sum = fuel.reduce(0, +)
    
    return sum
}


func part2(data: [Double]) -> Int {
    
    var sumOfModul = [Int]()
    var sumOfResult = [Int]() 
    
    for modul in input {
        var result: Double = modul
        while result > 0 {
            result = floor(result / 3.0) - 2.0
            if result > 0 {
                sumOfResult.append(Int(result))
            }
        }
        sumOfModul.append(sumOfResult.reduce(0, +))
        sumOfResult.removeAll()
    }
    
    let totalFuel = sumOfModul.reduce(0, +)
    return totalFuel
}

part1(data: input)
part2(data: input)

