//: Playground - noun: a place where people can play

import UIKit

class Item {
    let str: String
    init(_ str: String) {
        self.str = str
    }
}
// 拡張した配列の差分を計算するためにEquatable準拠
extension Item: Equatable { }
func == (left: Item, right: Item) -> Bool {
    return left.str == right.str
}


let item1 = Item("1")
let item2 = Item("2")
let item3 = Item("3")

var array1 = [item1]
var array2 = [item2, item3]
var array3 = [item1, item2, item3]

// 独自クラスの配列の結合
array1.append(contentsOf: array2)
array1.append(contentsOf: array1)
array2.append(contentsOf: array1)
array3.append(contentsOf: array3.map({
    if Int($0.str)! >= 2 { return Item("5") }
    return $0
}))

// 配列の差分
extension Array where Element: Equatable {
    typealias E = Element
    func substracting(_ other: [E]) -> [E] {
        return self.flatMap { element in
            if (other.filter { $0 == element }).count == 0 {
                return element
            } else {
                return nil
            }
        }
    }
    mutating func substract(_ other: [E]) {
        self = substracting(other)
    }
}

// 配列の差分
var a = [1,2,3,4]
let b = [2,4,6,8]

a.substracting(b)
a
a.substract(b)
a

// 独自クラスの配列の差分
print("-------")
print(array3.map{ $0.str })
print(array2.map{ $0.str })

let sub = array3.substracting(array2)
print(sub.map{ $0.str })

// 降順ソート
let sort1 = b.sorted{ $0 > $1 }
print(sort1)
print(b.sorted{ $0 > $1 })

// 独自クラスの配列を降順ソート
let sort2 = array3.sorted{ Int($0.str)! > Int($1.str)! }
print(sort2.map{ $0.str})



let setA: Set<Int>
let setB = Set<Int>()
let setC: Set = [5, 2, 3, 5, 1]


// tuple
let tuple = ("hoge","hoge")

