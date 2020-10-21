import UIKit

// Tape equilibrium
//var inputTap = [3, 1, 2, 4, 3]
var inputTap = [1,5,5,2,6]
public func solutionTape(_ blocks : inout [Int]) -> Int {
    // write your code in Swift 3.0 (Linux)
    // First make sums of left part and right part
    var maxDistance = 0
    
    for index in 0..<blocks.count {
        // Current position of frogs
        var currentFrogOne = index
        var currentFrogTwo = index
        
        // position frog one... moves to right
        for i in index+1..<blocks.count {
            //print("Current: \(blocks[currentFrogOne]), Next: \(blocks[i])")
            if blocks[i] >= blocks[currentFrogOne] {
                currentFrogOne = i
            }else {
                break
            }
        }
        
        // position frog two... moves to left
        for j in stride(from: index, to: 0, by: -1) {
            if (j == 0) {
                currentFrogTwo = 0
            }else if (blocks[j-1] >= blocks[j]) {
                currentFrogTwo = j-1
            }else {
                break
            }
        }
        
        let localMaxDistance = currentFrogOne - currentFrogTwo + 1
        print("Position One: \(currentFrogOne), Position Two: \(currentFrogTwo), Distance: \(localMaxDistance)")
        if localMaxDistance > maxDistance {
            maxDistance = localMaxDistance
        }
    }
    
    return maxDistance
}

print(solutionTape(&inputTap))


var inputB = [0,4,3,-1]
var S = 2

extension Int {
  var doubleValue: Double {
    return Double(self)
  }
}

public func solutionB(_ A : inout [Int], _ S : Int) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    
    // First make sums of left part and right part
    var left = 0.0
    var count = 0
    
    // For each to get all sums in array
    for i in 0..<A.count {
        for j in i..<A.count {
            left = A[i...j].reduce(0,+).doubleValue
            //print("Left : \(left), items: \(A[i...j].count), div: \(left/(A[i...j].count))")
            if left/(A[i...j].count.doubleValue) == S.doubleValue {
                count += 1
            }
        }
    }
    
    return count
}

print(solutionB(&inputB, S))


//var inputTap = [3, 1, 2, 4, 3]
//public func solutionTape(_ A : inout [Int]) -> Int {
//    // write your code in Swift 3.0 (Linux)
//    var leftSum = A[0]
//    var rightSum = A[1..<A.count].reduce(0, +)
//    var minDiff = abs(leftSum - rightSum)
//
//    for p in 2..<A.count {
//        leftSum += A[p-1]
//        rightSum -= A[p-1]
//        let diff = abs(leftSum - rightSum)
//        if minDiff > diff {
//            minDiff = diff
//        }
//    }
//    return minDiff
//}
//
//print(solutionTape(&inputTap))

extension Array where Element: Hashable {
    func difference(from other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))
    }
}

// Get perm missing element
var inputPermMissing = [4, 4, 6, 1, 4, 4, 2, 5]

func solutionPermMissing(_ A : inout [Int]) -> Int {
    
    //let ordered = A.sorted()
    let orderedSet = Array(Set(A)).sorted()
    let allNumbers = Array(1...orderedSet.last!)
    let difference = allNumbers.difference(from: orderedSet)
    
    return difference.first ?? 1
}

print(solutionPermMissing(&inputPermMissing))

// Perm check
// Perm is a array when contains all number in a sequancy
var inputPermCheck = [4, 4, 6, 1, 4, 4, 2, 5]

func solutionPermCheck(_ A : inout [Int]) -> Int {
    
    //let ordered = A.sorted()
    let orderedSet = Array(Set(A)).sorted()
    let allNumbers = Array(1...orderedSet.last!)
    let difference = allNumbers.difference(from: orderedSet)
    
    //return difference.first ?? orderedSet.last! + 1
    if difference.count == 0 {
        return 1 // es una permutacion
    }
    return 0  // no es una permutacion
}

print(solutionPermCheck(&inputPermCheck))

// Odd Ocureancces in array
// Find number with no pair
var inputOdd = [9, 3, 9, 3, 9, 7, 9]
public func solutionOdd(_ A : inout [Int]) -> Int {
    // write your code in Swift 3.0 (Linux)
    var inputElementCountDic = [Int: Int]()
    
    for element in A {
        if let count = inputElementCountDic[element] {
            inputElementCountDic[element] = count + 1
        } else {
            inputElementCountDic[element] = 1
        }
    }
    let solution = inputElementCountDic.first { (_, count) -> Bool in
        return count%2 != 0
    }
    return solution!.key
}

print(solutionOdd(&inputOdd))

// Minimum difference
// Find minimun number not appearing in array

var inputMinDifference = [3, 4, 4, 6, 1, 4, 4, 2, 5]


func solutionMinimunDifference(_ A : inout [Int]) -> Int {
    
    //let ordered = A.sorted()
    let orderedSet = Array(Set(A)).sorted()
    let allNumbers = Array(1...orderedSet.last!)
    let difference = allNumbers.difference(from: orderedSet)
    
    return difference.first ?? orderedSet.last! + 1
}

print(solutionMinimunDifference(&inputMinDifference))

// Max counters
var inputMaxCounters = [3, 4, 4, 6, 1, 4, 4]
let nMaxCounters = 5
public func solution(_ N : Int, _ A : inout [Int]) -> [Int] {
    
    let emptyCounterArray = [Int](repeating: 0, count: N)
    var counterArray = emptyCounterArray
    var maxDiff = 0
    var maxedTo = 0
    for element in A {
        if (element<=N) {
            let counterIndex = element - 1
            counterArray[counterIndex] += 1
            if counterArray[counterIndex] > maxDiff {
                maxDiff = counterArray[counterIndex]
            }
        } else if (element == N+1) {
            maxedTo += maxDiff
            maxDiff = 0
            counterArray = emptyCounterArray
        }
    }
    var result = [Int]()
    counterArray.forEach({ result.append(maxedTo + $0) })
    return result
}

print(solution(nMaxCounters, &inputMaxCounters))

// Frog river
// A frog needs to cross a river...
// Given an array of leaves to jump and

var inputFrogRiver = [1, 3, 1, 4, 2, 3, 5, 4]
let xFrogRiver = 3
public func solutionFrogRiver(_ X : Int, _ A : inout [Int]) -> Int {
    // write your code in Swift 3.0 (Linux)
    // Create a dictionary for positisions count dict
    var positionDict = [Int : Int]()
    for (index, item) in A.enumerated() {
        if item < X + 1 {
            if let count = positionDict[item] {
                positionDict[item] = count + 1
            }else {
                positionDict[item] = 1
                if positionDict.keys.count == X {
                    return index
                }
            }
        }
    }
    
    return -1
}

print(solutionFrogRiver(xFrogRiver, &inputFrogRiver))

// Frog jump
// A little frog in point A wants to go point B... it jumps C meters...
// Get minimum amount of jumps to get to point B

let x = 10
let y = 85
let d = 30
public func solutionFrogJum(_ X : Int, _ Y : Int, _ D : Int) -> Int {
  // write your code in Swift 3.0 (Linux)
    // Validate data
    if X > Y {
        return 0
    }
    
    let distance = Y - X
    var jumps = distance / D
    
    // Validate case when one jump more it's needed
    if distance % D > 0 {
        jumps += 1
    }
    return jumps
}

print(solutionFrogJum(x, y, d))

// Cycle rotation
// Given an array and a integer...
// Rotate array n times

var input = [3, 8, 9, 7, 6]
var inputK = 1

public func solutionCycleRotation(_ A : inout [Int], _ K : Int) -> [Int] {
  // write your code in Swift 3.0 (Linux)
    var rotatedArray = A
    
    // Validate K > 0
    if K == 0 {
        return A
    }
    
    for (index, item) in A.enumerated() {
        let newIndex = (index + K) % A.count
        rotatedArray[newIndex] = item
    }
    
    return rotatedArray
}

print(solutionCycleRotation(&input, inputK))

// Count divisors
// Given a range of numbers and a divisor
// Find the numbers in range divisibles to divisor

let a = 100
let b = 150
let c = 20

public func solutionCountDiv(_ A : Int, _ B : Int, _ K : Int) -> Int {
  // write your code in Swift 3.0 (Linux)
    // Check if range is valid
    if A > B {
        return 0
    }
    
    // Cover the case when...
    // If A module K is zero... sum 1
    var sum = 0
    if A % K == 0 {
        sum = 1
    }
    
    // Get divisors and sum
    let x = A / K
    let y = B / K
    
    return y - x + sum
}

print(solutionCountDiv(a, b, c))


// Binary gap...
// Given a integer number... convert to binary value
// Find the largest string of 0's and count it
// Return the count as an integer

let inputBinaryGap = 9999
public func solutionBinaryGap(_ N : Int) -> Int {

    // write your code in Swift 3.0 (Linux)
    // Convert to binary
    let binaryString = String(N, radix: 2)
    
    var gap = 0
    var temporalGap = 0
    
    // Check if contains 0's
    if !binaryString.contains("0") {
        return 0
    }
    
    // Find and count 0's
    for item in binaryString {
        if item == "0" {
            temporalGap += 1
        }else {
            if temporalGap > gap {
                gap = temporalGap
            }
            temporalGap = 0
        }
    }
    
    // This is for cover the case where it's only one zero and it's last character
    if temporalGap > gap {
        return temporalGap
    }
    return gap
}

print(solutionBinaryGap(inputBinaryGap))
